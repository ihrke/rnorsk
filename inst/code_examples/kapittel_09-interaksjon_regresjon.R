
## kapittel_09-interaksjon_regresjon.R
#
# Denne filen inneholder alle kildekoder fra kapittel 9 i
# Mehmetoglu & Mittner (2020). Innføring i R for statistiske dataanalyser. Universitetsforlaget.
##

## setup
library(tidyverse)
library(rnorsk)
theme_set(theme_rnorsk())

## -- Eksempel 1
#

library(dplyr) 
data(trening)
trening <- mutate(trening,
                  helsealder = helse * alder)

## -- Eksempel 2
#

lm(ttimer ~ helse + alder + helsealder, data=trening)

## -- Eksempel 3
#

lm(ttimer ~ helse + alder + helse:alder, data=trening)

## -- Eksempel 4
#

lm(ttimer ~ helse*alder, data=trening)

## -- Eksempel 5
#

model13 <- lm(ttimer ~ helse*alder, data=trening)

## -- Eksempel 6
#

summary(model13)

## -- Eksempel 7
#

library(interactions) 
sim_slopes(model13, pred="helse", modx="alder", 
           modx.values = c(16,26,36,46,56,66,76), 
           johnson_neyman=FALSE)

## -- Eksempel 8
#

library(ggplot2) 
interact_plot(model13, pred="helse", modx="alder", 
              modx.values = c(16,26,36,46,56,66,76), 
              colors=c("red", "green","violet", "blue", "orange", 
                       "turquoise", "gray"),  
              line.thickness=1.5, vary.lty=FALSE) + theme_bw()

## -- Eksempel 9
#

model14 <- lm(ttimer ~ alder*kjoenn, data=trening)

## -- Eksempel 10
#

summary(model14)

## -- Eksempel 11
#

sim_slopes(model14, pred="alder", modx="kjoenn", 
           modx.values = c(0, 1), johnson_neyman=FALSE)

## -- Eksempel 12
#

interact_plot(model14, pred="alder", modx="kjoenn", 
              modx.values = c(0, 1), 
              modx.labels = c("kvinner", "menn"), 
              colors=c("red", "green"),  
              line.thickness=1.5, vary.lty=FALSE) + theme_bw()

## -- Eksempel 13
#

model15 <- lm(ttimer ~ kjoenn*sivsta, data=trening)

## -- Eksempel 14
#

summary(model15)

## -- Eksempel 15
#

sim_slopes(model15, pred="kjoenn", modx="sivsta", 
           modx.values = c(0, 1), 
           johnson_neyman=FALSE)

## -- Eksempel 16
#

interact_plot(model15, pred="kjoenn", modx="sivsta", 
              modx.values = c(0, 1), 
              modx.labels = c("gift", "singel") ,
              colors=c("red", "green"),  
              line.thickness=1.5, vary.lty=FALSE) + theme_bw()

## -- Eksempel 17
#

library(dplyr) 
trening <- mutate(trening, 
                utdann = factor(utdann,
                  levels = c(1, 2, 3),
                   labels = c("grunn/videreg", "universitet",
                              "mer.enn.universitet")))

## -- Eksempel 18
#

model16 <- lm(ttimer ~ alder*utdann, data=trening)

## -- Eksempel 19
#

summary(model16)

## -- Eksempel 20
#

sim_slopes(model16, pred="alder", modx="utdann", 
           modx.values = c("grunn/videreg", "universitet",
                              "mer.enn.universitet"), 
           johnson_neyman=FALSE)

## -- Eksempel 21
#

interact_plot(model16, pred="alder", modx="utdann", 
              modx.values = c("grunn/videreg", "universitet",
                              "mer.enn.universitet"),
              colors=c("red", "green", "blue"),  
              line.thickness=1.5, vary.lty=FALSE) + theme_bw()

## -- Eksempel 22
#

library(car) 
linearHypothesis(model16,
                 c("alder:utdannuniversitet = 0", 
                   "alder:utdannmer.enn.universitet = 0"))

