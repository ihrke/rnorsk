
## kapittel_01-intro.R
#
# Denne filen inneholder alle kildekoder fra kapittel 1 i
# Mehmetoglu & Mittner (2020). Innføring i R for statistiske dataanalyser. Universitetsforlaget.
##

## setup
library(tidyverse)
library(rnorsk)
theme_set(theme_rnorsk())

## -- Eksempel 1
#

help.search("factor analysis")

## -- Eksempel 2
#

??"factor analysis"

## -- Eksempel 3
#

help(anova)

## -- Eksempel 4
#

install.packages("haven")

## -- Eksempel 5
#

library(haven)

## -- Eksempel 6
#

remove.packages("haven")

## -- Eksempel 7
#

detach("package:haven")

## -- Eksempel 8
#

pakker <- installed.packages()
navnpakker <- rownames(pakker)
save(navnpakker, file="minepakker.Rdata")

## -- Eksempel 9
#

load("minepakker.Rdata")
install.packages(navnpakker)

## -- Eksempel 10
#

update.packages()

