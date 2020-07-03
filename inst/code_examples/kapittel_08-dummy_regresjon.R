
## kapittel_08-dummy_regresjon.R
#
# Denne filen inneholder alle kildekoder fra kapittel 8 i
# Mehmetoglu & Mittner (2020). Innføring i R for statistiske dataanalyser. Universitetsforlaget.
##

## setup
library(tidyverse)
library(rnorsk)
theme_set(theme_rnorsk())

## -- Eksempel 1
#

library(dplyr)
library(rnorsk)
leilighet <- mutate(leilighet,
                sentrum = if_else(beliggenhet==1, 1, 0),
                soer    = if_else(beliggenhet==2, 1, 0),
                vest    = if_else(beliggenhet==3, 1, 0),
                oest    = if_else(beliggenhet==4, 1, 0)
                )

## -- Eksempel 2
#

names(leilighet)

## -- Eksempel 3
#

library(fastDummies)
leilighet <- dummy_cols(leilighet, select_columns="beliggenhet")

## -- Eksempel 4
#

names(leilighet)

## -- Eksempel 5
#

mod <- lm(pris ~ factor(beliggenhet), data=leilighet)
coef(mod)

## -- Eksempel 6
#

library(rnorsk)
leilighet <- mutate(leilighet,
                sentrum_lei = if_else(beliggenhet==1, 1, 0))

## -- Eksempel 7
#

model1 <- lm(pris ~ sentrum_lei, data = leilighet)

## -- Eksempel 8
#

model2 <- lm(pris ~ (beliggenhet==1), data = leilighet)

## -- Eksempel 9
#

summary(model2)

## -- Eksempel 10
#

model3 <- lm(pris ~ (beliggenhet==1) + stoerrelse, 
             data = leilighet)

## -- Eksempel 11
#

summary(model3)

## -- Eksempel 12
#

leilighet <- mutate(leilighet, 
                      beliggenhet = 
                        factor(beliggenhet,
                               levels = c(1, 2, 3, 4),
                               labels = c("sentrum", "soer",
                                          "vest", "oest")))

## -- Eksempel 13
#

model4 <- lm(pris ~ beliggenhet, data = leilighet)

## -- Eksempel 14
#

summary(model4)

## -- Eksempel 15
#

leilighet$beliggenhet <- relevel(leilighet$beliggenhet, 
                                 ref="soer") 
model5 <- lm(pris ~ beliggenhet, data = leilighet)

## -- Eksempel 16
#

leilighet$beliggenhet <- relevel(leilighet$beliggenhet, 
                                 ref="vest") 
model6 <- lm(pris ~ beliggenhet, data = leilighet)

## -- Eksempel 17
#

library(multcomp)
soerVSvest <- glht(model4, linfct = 
                    c("beliggenhetsoer - beliggenhetvest = 0"))
summary(soerVSvest)

## -- Eksempel 18
#

soerVSoest <- glht(model4, linfct = 
                   c("beliggenhetsoer - beliggenhetoest = 0"))
summary(soerVSoest)

## -- Eksempel 19
#

vestVSoest <- glht(model4, linfct = 
                    c("beliggenhetvest - beliggenhetoest = 0"))
summary(vestVSoest)

## -- Eksempel 20
#

leilighet <- 
  leilighet %>% 
  mutate(beliggenhet = factor(beliggenhet, 
                              levels = c("sentrum", "soer", 
                                         "vest", "oest")))

## -- Eksempel 21
#

library(dplyr)
leilighet %>% 
  group_by(beliggenhet) %>% 
  summarize(mean(pris))

## -- Eksempel 22
#

library(ggplot2)
ggplot(leilighet, aes(x=beliggenhet, y=pris, 
                      colour=beliggenhet)) +
    geom_boxplot() +
    stat_summary(fun.data=mean_cl_normal, geom="pointrange", 
                 colour="blue", width=0.1) +
    stat_summary(fun.y=mean, geom="line", 
                 colour="black", aes(group=1)) +
    geom_jitter(size=0.1)

## -- Eksempel 23
#

library(multcomp)
library(sandwich)
compTukey <- glht(model4, linfct=mcp(beliggenhet="Tukey"),
                  vcov=sandwich)

## -- Eksempel 24
#

summary(compTukey)

## -- Eksempel 25
#

anova(model4)

## -- Eksempel 26
#

model7 <- lm(pris ~ beliggenhet + stoerrelse, data = leilighet)
summary(model7)

## -- Eksempel 27
#

leilighet <- mutate(leilighet, 
                      miljoemerking = 
                        factor(miljoemerking,
                               levels = c(1, 2, 3),
                               labels = c("best", "middels",
                                          "daarlig")))

## -- Eksempel 28
#

model8 <- lm(pris ~ beliggenhet + miljoemerking, data = leilighet)
summary(model8)

## -- Eksempel 29
#

library(car)
linearHypothesis(model8, c("beliggenhetsoer = 0", 
                           "beliggenhetvest = 0", 
                           "beliggenhetoest = 0"))
linearHypothesis(model8, c("miljoemerkingmiddels = 0", 
                           "miljoemerkingdaarlig = 0"))

