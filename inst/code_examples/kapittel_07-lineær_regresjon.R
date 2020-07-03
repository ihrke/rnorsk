
## kapittel_07-lineær_regresjon.R
#
# Denne filen inneholder alle kildekoder fra kapittel 7 i
# Mehmetoglu & Mittner (2020). Innføring i R for statistiske dataanalyser. Universitetsforlaget.
##

## setup
library(tidyverse)
library(rnorsk)
theme_set(theme_rnorsk())

## -- Eksempel 1
#

library(rnorsk)
data(leilighet)
head(leilighet)

## -- Eksempel 2
#

lm(pris ~ stoerrelse, leilighet)

## -- Eksempel 3
#

model01 <- lm(pris ~ stoerrelse, leilighet)

## -- Eksempel 4
#

summary(model01)

## -- Eksempel 5
#

confint(model01)

## -- Eksempel 6
#

xvals <- data.frame(stoerrelse=c(60, 80, 100, 120, 140, 
                                 160, 180, 200, 220))
predvals <- predict(model01, newdata = xvals, 
                    interval = "confidence", level = 0.95)
xvals_pvals <- cbind(xvals, predvals)
xvals_pvals

## -- Eksempel 7
#

ggplot(xvals_pvals, aes(x=stoerrelse, y=fit)) +
  geom_smooth(aes(ymin = lwr, ymax = upr), 
              stat = "identity") 

## -- Eksempel 8
#

library(rnorsk)
data(gave)
head(gave)

## -- Eksempel 9
#

model02 <- lm(gave_verdi ~ attraktiv + snill + alder, data=gave)
summary(model02)

## -- Eksempel 10
#

confint(model02)

## -- Eksempel 11
#

library(lm.beta)
lm.beta(model02)

## -- Eksempel 12
#

gave_stand <- data.frame(scale(gave))
model03 <- lm(gave_verdi ~ attraktiv + snill + alder, 
              data=gave_stand)
summary(model03)

## -- Eksempel 13
#

confint(model03)

## -- Eksempel 14
#

library(multcomp)
comp1 <- glht(model03, linfct=c("attraktiv - snill = 0"))
summary(comp1)

## -- Eksempel 15
#

comp2 <- glht(model03, linfct=c("attraktiv - alder = 0"))
summary(comp2)

## -- Eksempel 16
#

comp3 <- glht(model03, linfct=c("snill - alder = 0"))
summary(comp3)

## -- Eksempel 17
#

library(relaimpo)  
calc.relimp(model02, type="last")

## -- Eksempel 18
#

xsvals <- data.frame(attraktiv=7, snill=7, alder=50)
predval <- predict(model02, newdata = xsvals, 
                   interval = "confidence", level = 0.95)
xsvals_pval <- cbind(xsvals, predval)
xsvals_pval

## -- Eksempel 19
#

xsvals2 <- data.frame(attraktiv=c(1,2,3,4,5,6,7), 
                      snill=mean(gave$snill), 
                      alder=mean(gave$alder))
predval2 <- predict(model02, newdata = xsvals2, 
                    interval = "confidence", 
                    level = 0.95)
xsvals_pval2 <- cbind(xsvals2, predval2)
xsvals_pval2

## -- Eksempel 20
#

ggplot(xsvals_pval2, aes(x=attraktiv, y=fit)) +
  geom_smooth(aes(ymin = lwr, ymax = upr), 
              stat = "identity") 

## -- Eksempel 21
#

library(stargazer)
stargazer(model02, type="text", 
          keep.stat=c("n", "rsq"),
          out="model.txt")

## -- Eksempel 22
#

plot(model02)

## -- Eksempel 23
#

regression.diagnostics(model02) 

## -- Eksempel 24
#

gave2 <- gave %>%
  add_row(gave_verdi=20000, attraktiv=1, snill=8, alder=2)
model02.utligger <- lm(gave_verdi ~ attraktiv + snill + alder, 
                        data=gave2)
regression.diagnostics(model02.utligger) 

