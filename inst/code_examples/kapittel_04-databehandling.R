
## kapittel_04-databehandling.R
#
# Denne filen inneholder alle kildekoder fra kapittel 4 i
# Mehmetoglu & Mittner (2020). Innføring i R for statistiske dataanalyser. Universitetsforlaget.
##

## setup
library(tidyverse)
library(rnorsk)
theme_set(theme_rnorsk())

## -- Eksempel 1
#

library(dplyr)

## -- Eksempel 2
#

ChickWeight2 <- mutate(ChickWeight, log_weight = log(weight))

## -- Eksempel 3
#

head(ChickWeight2)

## -- Eksempel 4
#

ChickWeight2 <- mutate(ChickWeight2, int_time_weight = Time*weight)

## -- Eksempel 5
#

head(ChickWeight2)

## -- Eksempel 6
#

ChickWeight2 <- 
  mutate(ChickWeight,
          weight5 = case_when(weight <= 50 ~ 1,
                              weight > 50 & weight <= 100 ~ 2, 
                              weight > 100 & weight <= 150 ~ 3,
                              weight > 150 & weight <= 200 ~ 4,
                              TRUE ~ 5))

## -- Eksempel 7
#

head(ChickWeight2, 5)

## -- Eksempel 8
#

ChickWeight2 <- mutate(ChickWeight2, 
                      weight5_2 = 
                        factor(weight5,
                               levels = c(1, 2, 3, 4, 5),
                               labels = c("veldig liten", "liten",
                                          "medium", "stor", 
                                          "veldig stor")))

## -- Eksempel 9
#

head(ChickWeight2)

## -- Eksempel 10
#

ChickWeight2 <- mutate(ChickWeight2, 
                      weight = replace(weight, weight==42, 144))

## -- Eksempel 11
#

head(ChickWeight2)

## -- Eksempel 12
#

ChickWeight2 <- mutate(ChickWeight2, 
                      weight = replace(weight, weight==93, 555),
                      Time = replace(Time, Time==0, 30),
                      Diet = replace(Diet, Diet==1, 2))

## -- Eksempel 13
#

head(ChickWeight2)

## -- Eksempel 14
#

ChickWeight2 <- mutate(ChickWeight2, 
                      weight = replace(weight, Time==8 & Diet==2, 
                                       2222))

## -- Eksempel 15
#

head(ChickWeight2)

## -- Eksempel 16
#

ChickWeight2 <- mutate(ChickWeight2, 
                      weight = replace(weight, weight < 60, NA),
                      Time = replace(Time, Time >= 10, NA))


## -- Eksempel 17
#

head(ChickWeight2)

## -- Eksempel 18
#

ChickWeight2 <- rename(ChickWeight2, Chick_number = Chick)

## -- Eksempel 19
#

head(ChickWeight2)

## -- Eksempel 20
#

ChickWeight2 <- rename(ChickWeight2, weight_gr = weight,
                                     days = Time,
                                     diet_rec = Diet)
head(ChickWeight2)

## -- Eksempel 21
#

colSums(is.na(ChickWeight2))

## -- Eksempel 22
#

which(is.na(ChickWeight2$weight_gr))

## -- Eksempel 23
#

colSums(!is.na(ChickWeight2))

## -- Eksempel 24
#

sum(complete.cases(ChickWeight2))

## -- Eksempel 25
#

mean(ChickWeight2$weight_gr)

## -- Eksempel 26
#

mean(ChickWeight2$weight_gr, na.rm=TRUE)

## -- Eksempel 27
#

summary(ChickWeight2$weight_gr)

## -- Eksempel 28
#

summary(lm(weight_gr ~ days, data=ChickWeight2))

## -- Eksempel 29
#

ChickWeight3 <- na.omit(ChickWeight2)
dim(ChickWeight3)

## -- Eksempel 30
#

dummy <- model.matrix(~ diet_rec + 0,data=ChickWeight2) 

## -- Eksempel 31
#

head(dummy)

## -- Eksempel 32
#

Chickweight2 <- mutate(ChickWeight2, 
                       diet_rec1=if_else(diet_rec==1,  1, 0),
                       diet_rec2=if_else(diet_rec==2,  1, 0),
                       diet_rec3=if_else(diet_rec==3,  1, 0),
                       diet_rec4=if_else(diet_rec==4,  1, 0) )

## -- Eksempel 33
#

eksdata <- data.frame(Alder = c(28, 35, 45, 29, 43, 50, 32),
                      Antallfag = factor(c(5, 8, 9, 8, 12, 15, 9)),
                      Studie = c("econ","psy","lit","lit",
                                 "econ","soc","geog"), 
                      stringsAsFactors = FALSE)

## -- Eksempel 34
#

str(eksdata)

## -- Eksempel 35
#

eksdata <- mutate(eksdata,
                  Studie = as.factor(Studie))

## -- Eksempel 36
#

eksdata <- mutate(eksdata,
                  Antallfag = as.numeric(as.character(Antallfag)))

## -- Eksempel 37
#

as.numeric(c("hundred", "eleven", "ten", "10"))

## -- Eksempel 38
#

eksdata <- mutate(eksdata, 
              Alder = as.factor(Alder))

## -- Eksempel 39
#

eksdata <- mutate(eksdata,
                  Motivasjon = c(2, 5, 4, 2, 1, 5, 3))

## -- Eksempel 40
#

library(Hmisc)

## -- Eksempel 41
#

label(eksdata$Motivasjon) <- 
  "1 = ikke motivert, 5 = veldig motivert" 

## -- Eksempel 42
#

str(eksdata)

## -- Eksempel 43
#

land <- factor(c("England", "Storbritannia", "Holland", 
                 "Nederland", "Holland", "England", 
                 "Storbritannia"))

## -- Eksempel 44
#

library(forcats)
fct_recode(land, 
           Nederland="Holland",
           Storbritannia="England")

## -- Eksempel 45
#

land <- factor(c("Dutch", "Wales", "Skottland", "Holland", 
                 "Nederland", "Storbritannia", "England"))

## -- Eksempel 46
#

land <- fct_collapse(land,
             Nederland = c("Dutch", "Holland", "Nederland"),
             Storbritannia = c("Wales", "Skottland", 
                               "Storbritannia", "England"))
land

## -- Eksempel 47
#

names(msq)

## -- Eksempel 48
#

personality <- select(msq, Extraversion, Neuroticism, Lie, 
                      Sociability, Impulsivity)

## -- Eksempel 49
#

dim(personality)

## -- Eksempel 50
#

personality2 <- select(msq, 
                       Extraversion:Impulsivity)
dim(personality2)

## -- Eksempel 51
#

personality3 <- select(personality, 
                       -Lie, -Sociability)

## -- Eksempel 52
#

names(personality3)

## -- Eksempel 53
#

library(psych)
kvbfi <- filter(bfi, gender == 2)

## -- Eksempel 54
#

dim(kvbfi)

## -- Eksempel 55
#

library(summarytools)
freq(bfi$gender, report.nas = FALSE)

## -- Eksempel 56
#

kv50vid_bfi <- filter(bfi, gender==2 & education==2 & age>40)

## -- Eksempel 57
#

dim(kv50vid_bfi)

## -- Eksempel 58
#

dim(filter(bfi, age<20 | age>40))

## -- Eksempel 59
#

første50 <- slice(bfi, 1:50)

## -- Eksempel 60
#

dim(første50)

## -- Eksempel 61
#

nonseqdata <- slice(bfi,
              c(5, 12, 27, 44, 66, 234, 555, 600, 734, 891))

## -- Eksempel 62
#

dim(nonseqdata)

## -- Eksempel 63
#

datasett1 <- data.frame(hoeyde = c(178, 193, 165, 185, 170),
                        alder = c(18, 23, 21, 35, 66))
datasett1

## -- Eksempel 64
#

datasett2 <- data.frame(kjoenn = c("M", "M", "K", "M", "K"),
                        vekt = c(92, 105, 57, 88, 60))
datasett2

## -- Eksempel 65
#

datasett3 <- bind_cols(datasett1, datasett2)

## -- Eksempel 66
#

datasett3

## -- Eksempel 67
#

data1 <- data.frame(timer_trent = c(2, 1, 0, 5, 8, 22),
                    alder = c(66, 34, 39, 25, 27, 21))

data2 <- data.frame(timer_trent = c(5, 15, 3, 4, 7, 18),
                    alder = c(22, 25, 50, 44, 33, 21))

## -- Eksempel 68
#

data3 <- bind_rows(data1, data2)
data3

## -- Eksempel 69
#

data_stig_hoeyde <- arrange(datasett3, hoeyde)
data_stig_hoeyde

## -- Eksempel 70
#

arrange(datasett3, kjoenn, vekt)

## -- Eksempel 71
#

gruppe <- c(1, 2, 3, 4)
    t1 <- c(5, 3, 2, 6)
    t2 <- c(6, 4, 6, 5)
    t3 <- c(6, 5, 6, 7)
    t4 <- c(7, 6, 8, 9)
vid_data <- data.frame(gruppe, t1, t2, t3, t4)
vid_data

## -- Eksempel 72
#

library(tidyr)
lang_data <- gather(vid_data, Tidspunkt, stressnivå, t1:t4)
lang_data

## -- Eksempel 73
#

vid_data2 <- spread(lang_data, Tidspunkt, stressnivå)

## -- Eksempel 74
#

vid_data2
vid_data

## -- Eksempel 75
#

names(bfi)

## -- Eksempel 76
#

bfi_ord <- select(bfi, gender, education, age, everything())

## -- Eksempel 77
#

names(bfi_ord)

## -- Eksempel 78
#

bfi_ord2 <- select(bfi, starts_with("N"), everything())
names(bfi_ord2)

## -- Eksempel 79
#

Orange_10 <- sample_n(Orange, 10)

## -- Eksempel 80
#

dim(Orange_10)

## -- Eksempel 81
#

Orange_40p <- sample_frac(Orange, 0.4)

## -- Eksempel 82
#

dim(Orange_40p)

## -- Eksempel 83
#

data(ChickWeight)
head(ChickWeight)

## -- Eksempel 84
#

Diet2Chicks <- filter(ChickWeight, Diet == 1)
head(Diet2Chicks)

## -- Eksempel 85
#

ChickWeight4 <- ChickWeight %>% 
                  filter(Diet == 1) %>% 
                  mutate(logweight = weight) %>% 
                  select(logweight) %>% 
                  sample_n(5) 

## -- Eksempel 86
#

ChickWeight4

