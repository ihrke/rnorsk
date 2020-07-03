
## kapittel_11-faktoranalyse.R
#
# Denne filen inneholder alle kildekoder fra kapittel 11 i
# Mehmetoglu & Mittner (2020). Innføring i R for statistiske dataanalyser. Universitetsforlaget.
##

## setup
library(tidyverse)
library(rnorsk)
theme_set(theme_rnorsk())

## -- Eksempel 1
#

library(rnorsk)
data(trening3)
library(dplyr)
trening3_komp <- filter(trening3,
                        complete.cases(trening3))

## -- Eksempel 2
#

library(psych)
paranalysis <- fa.parallel(trening3_komp, fm="pa", fa="fa", 
                           SMC="TRUE")

## -- Eksempel 3
#

print(paranalysis)

## -- Eksempel 4
#

kmk <- smc(trening3_komp)
kmk
mean(kmk)

## -- Eksempel 5
#

library(psych)
fmodel1 <- fa(trening3_komp,
              nfactors = 2, 
              fm="pa",
              rotate = "varimax")

## -- Eksempel 6
#

print(fmodel1$n.obs)

## -- Eksempel 7
#

print(fmodel1$loadings, digits=4, cutoff=0)

## -- Eksempel 8
#

fa.plot(fmodel1, labels=rownames(fmodel1$loadings), 
        pos=4, show.points = FALSE)

## -- Eksempel 9
#

kom <- fmodel1$communality
kom
sum(kom)

## -- Eksempel 10
#

cbind(h2=fmodel1$communality, u2=fmodel1$uniquenesses) 

## -- Eksempel 11
#

library(psych)
itemlist <- list(avslapping=c("Var1","Var2","Var3"),
                 utseende=c("Var4","Var5","Var6"))
sammensatt <- scoreItems(itemlist, trening3_komp, 
                         min=1, max=6, totals = FALSE)
faktordata <- as.data.frame(sammensatt$scores)

## -- Eksempel 12
#

library(dplyr)
trening3_komp <- bind_cols(trening3_komp, faktordata)
names(trening3_komp)

## -- Eksempel 13
#

avslapping <- data.frame(trening3_komp[,1:3])
alpha(avslapping)$total$std.alpha

## -- Eksempel 14
#

utseende <- data.frame(trening3_komp[,4:6])
alpha(utseende)$total$std.alpha

