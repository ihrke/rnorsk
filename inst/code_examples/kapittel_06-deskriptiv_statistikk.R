
## kapittel_06-deskriptiv_statistikk.R
#
# Denne filen inneholder alle kildekoder fra kapittel 6 i
# Mehmetoglu & Mittner (2020). Innføring i R for statistiske dataanalyser. Universitetsforlaget.
##

## setup
library(tidyverse)
library(rnorsk)
theme_set(theme_rnorsk())

## -- Eksempel 1
#

library(rnorsk)
data("olympic")

hoeyde <- filter(olympic, Sex=="F", !is.na(Height)) %>% 
  pull(Height)

sum(hoeyde)/length(hoeyde) # gjennomsnitt

## -- Eksempel 2
#

mean(hoeyde)

## -- Eksempel 3
#

ggplot(data.frame(hoeyde),aes(x=hoeyde)) + 
  geom_histogram(bins=15)+
  # beregn og vis gjennomsnitt som rød linje
  geom_vline(xintercept = mean(hoeyde), 
             color="red") 

## -- Eksempel 4
#

median(hoeyde)

## -- Eksempel 5
#

hoeyde.med.utligger <- c(hoeyde, 160000)

## -- Eksempel 6
#

mean(hoeyde.med.utligger) 
median(hoeyde.med.utligger) 

## -- Eksempel 7
#

library(modeest)
mlv(hoeyde)

## -- Eksempel 8
#

sum( ( hoeyde-mean(hoeyde) )^2 ) / (length(hoeyde)-1)

## -- Eksempel 9
#

var(hoeyde)

## -- Eksempel 10
#

sd(hoeyde)

## -- Eksempel 11
#

quantile(hoeyde)

## -- Eksempel 12
#

quantile(hoeyde, probs=c(0.05, 0.10, 0.9, 0.95))

## -- Eksempel 13
#

range(hoeyde)

## -- Eksempel 14
#

IQR(hoeyde)

## -- Eksempel 15
#

library(moments)
dodsalder <- doede %>% uncount(doede) %>% pull(alder)
pris <- leilighet %>% pull(pris)

tribble(
  ~dataset,    ~skewness,           ~kurtosis,
   "olympic",   skewness(hoeyde),    kurtosis(hoeyde),
   "doede",     skewness(dodsalder), kurtosis(dodsalder),
   "leilighet", skewness(pris),      kurtosis(pris)
)

## -- Eksempel 16
#

mean(olympic$Sex)

## -- Eksempel 17
#

table(olympic$Sex)

## -- Eksempel 18
#

table(olympic$Medal, useNA="always")

## -- Eksempel 19
#

olympic %>% 
  group_by(Medal) %>%
  summarize(antall=n())

## -- Eksempel 20
#

length( unique(olympic$Team) )

## -- Eksempel 21
#

teams <- unique(olympic$Team)
tail(teams)

## -- Eksempel 22
#

land <- teams[!str_detect(teams, "-")]
length(land)

## -- Eksempel 23
#

olympic %>% 
  group_by(Team) %>%
  summarise(antall=n()) %>% 
  arrange(desc(antall)) %>%
  head(10)

## -- Eksempel 24
#

summary(studentHeights)

## -- Eksempel 25
#

library(summarytools)
descr(olympic)

## -- Eksempel 26
#

freq(olympic$Medal)

## -- Eksempel 27
#

dfSummary(studentHeights)

## -- Eksempel 28
#

library(skimr)

olympic %>% skim(Team,Height,Weight)

## -- Eksempel 29
#

olympic %>% group_by(Sex) %>% 
  skim(Team,Height,Weight) 

## -- Eksempel 30
#

olympic %>% group_by(Sex) %>% 
  skim(Team,Height,Weight) %>%
  filter(skim_type=="numeric") 

## -- Eksempel 31
#

olympic.kvinner <- olympic %>% filter(Sex=="F") %>% na.omit
hoeyde <- pull(olympic.kvinner, Height)
vekt <- pull(olympic.kvinner, Weight)
cor(hoeyde,vekt)

## -- Eksempel 32
#

big.five <- epi.bfi %>% select(starts_with("bf"))
cor(big.five)

## -- Eksempel 33
#

lowerCor(big.five)

## -- Eksempel 34
#

olympic.kvinner %>% select_if(is.numeric) %>% lowerCor

## -- Eksempel 35
#

table(studentHeights$kjoenn, studentHeights$aar)

## -- Eksempel 36
#

library(summarytools)
ctable(studentHeights$kjoenn,studentHeights$aar)

## -- Eksempel 37
#

olympic.ball <- olympic %>% 
  filter(Sport %in% c("Basketball", "Football", "Volleyball")) %>% 
  select(Sport,Medal,Sex)
table(olympic.ball)

## -- Eksempel 38
#

olympic %>% 
  group_by(Sex) %>% ## del inn manlige vs. kvinnelige utøvere
  filter(!is.na(Height)) %>% ## ta bort missing values
  summarize(gjennomsnitt=mean(Height), ## beregn gjennomsnitt,
            median=median(Height),     ## median mfl.
            sd=sd(Height),
            skjevhet=skewness(Height),
            kurtosis=kurtosis(Height))


## -- Eksempel 39
#

data("stroop")
str(stroop)

## -- Eksempel 40
#

RT <- stroop %>% filter(subj=="120554") %>% pull(RT)
mean(RT)

## -- Eksempel 41
#

mean.rt <- stroop %>% 
  group_by(subj) %>%
  summarize(mean.RT=mean(RT,na.rm=T)) 
str(mean.rt)

## -- Eksempel 42
#

mean.rt %>%
  summarize(gruppegjennomsnitt=mean(mean.RT),
            median=median(mean.RT),
            sd=sd(mean.RT),
            skevhet=skewness(mean.RT),
            kurtosis=kurtosis(mean.RT))

## -- Eksempel 43
#

mean.rt.cond <- stroop %>% 
  group_by(subj,condition) %>%
  summarize(mean.RT=mean(RT,na.rm=T)) 
head(mean.rt.cond)

## -- Eksempel 44
#

mean.rt.cond %>%
  group_by(condition) %>%
  summarize(gruppegjennomsnitt.RT=mean(mean.RT)) 

