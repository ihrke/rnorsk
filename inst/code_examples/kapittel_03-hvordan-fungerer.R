
## kapittel_03-hvordan-fungerer.R
#
# Denne filen inneholder alle kildekoder fra kapittel 3 i
# Mehmetoglu & Mittner (2020). Innføring i R for statistiske dataanalyser. Universitetsforlaget.
##

## setup
library(tidyverse)
library(rnorsk)
theme_set(theme_rnorsk())

## -- Eksempel 1
#

mean(var1) 

## -- Eksempel 2
#

help(mean)

## -- Eksempel 3
#

var1 <- c(5,3,NA,1,2,NA,3,1,2,4,3,4)   

## -- Eksempel 4
#

mean(var1, trim=0.1, na.rm=TRUE)

## -- Eksempel 5
#

gjennomsnitt <- mean(var1, trim=0.1, na.rm=TRUE)

## -- Eksempel 6
#

timeloenn <- 345

## -- Eksempel 7
#

timeloenn

## -- Eksempel 8
#

timeloenn <- 35

## -- Eksempel 9
#

timeloenn_eur <- 35

## -- Eksempel 10
#

timeloenn_eur <- timeloenn/9.9
timeloenn_eur

## -- Eksempel 11
#

timeloenn_eur <- round(timeloenn/9.9)
timeloenn_eur

## -- Eksempel 12
#

kjoenn <- "kvinne"
kjoenn

## -- Eksempel 13
#

class(kjoenn)

## -- Eksempel 14
#

class(timeloenn)

## -- Eksempel 15
#

timeloenn <- c(270, 330, 655, 445, 150)
timeloenn

## -- Eksempel 16
#

timeloenn1 <- c(270, 330, 655, 445, 150, 277, 338, 605, 
                415, 159, 279, 339, 555, 345, 450, 274, 
                630, 855, 745, 159, 278, 390, 855, 485, 750)
timeloenn1

## -- Eksempel 17
#

kjoenn <- c("mann", "kvinne", "mann", "mann", "kvinne")

## -- Eksempel 18
#

kjoenn

## -- Eksempel 19
#

timeloenn/9.9

## -- Eksempel 20
#

log(timeloenn)

## -- Eksempel 21
#

timeloenn3 <- c(270, 330, 655, 445, 150, 277, 338, 605, 415)
timeloenn3[4]

## -- Eksempel 22
#

timeloenn3[c(2, 5)]

## -- Eksempel 23
#

timeloenn3[-c(3, 6)]

## -- Eksempel 24
#

timeloenn4 <- timeloenn3[-c(3, 6)]

## -- Eksempel 25
#

timeloenn4

## -- Eksempel 26
#

timeloenn4[c(4,6)] <- c(555,444)

## -- Eksempel 27
#

timeloenn4

## -- Eksempel 28
#

timeloenn <- c(270, 330, 655, 445, 150)
respid <- c(1,2,3,4,5)
alder <- c(34, 46, 51, 39, 22)
kjoenn <- c("mann", "kvinne", "mann", "mann", "kvinne")
utdann <- c(10, 12, 15, 13, 8)

## -- Eksempel 29
#

data.frame(respid, timeloenn, alder, kjoenn, utdann)

## -- Eksempel 30
#

loenn_data <- data.frame(respid, timeloenn, alder, kjoenn, utdann)

## -- Eksempel 31
#

loenn_data

## -- Eksempel 32
#

str(loenn_data)

## -- Eksempel 33
#

loenn_data$alder

## -- Eksempel 34
#

alder_fra_ld <- loenn_data$alder

## -- Eksempel 35
#

alder_fra_ld

## -- Eksempel 36
#

alder_fra_ld <- loenn_data[ ,3]

## -- Eksempel 37
#

alder_fra_ld <- loenn_data[ ,"alder"]

## -- Eksempel 38
#

alder_fra_ld

## -- Eksempel 39
#

tlkjo_fra_ld <- loenn_data[ ,c("timeloenn","kjoenn")]

## -- Eksempel 40
#

tlkjo_fra_ld <- loenn_data[ ,c(2,4)]

## -- Eksempel 41
#

tlkjo_fra_ld

## -- Eksempel 42
#

loenn_data[4,]

## -- Eksempel 43
#

loenn_data[2:4,]

## -- Eksempel 44
#

loenn_data[c(1,4:5),]

## -- Eksempel 45
#

mann <- loenn_data[ ,"kjoenn"]=="mann"
loenn_data[mann,]

## -- Eksempel 46
#

mann

## -- Eksempel 47
#

print(loenn_data)
print(loenn_data2)

## -- Eksempel 48
#

loenn_data_m <- rbind(loenn_data, loenn_data2)
loenn_data_m

## -- Eksempel 49
#

sivstat <- c("single","gift","gift","gift","single")
sivstat

## -- Eksempel 50
#

loenn_data_siv <- cbind(loenn_data, sivstat)
loenn_data_siv

## -- Eksempel 51
#

colnames(loenn_data)

## -- Eksempel 52
#

colnames(loenn_data)[3] <- "age"

## -- Eksempel 53
#

head(loenn_data, 3)

## -- Eksempel 54
#

colnames(loenn_data) <- c("respid","wage","age","gender","educ")
head(loenn_data,3)

## -- Eksempel 55
#

mat1 <- matrix(1:9, ncol=3)

## -- Eksempel 56
#

mat1

## -- Eksempel 57
#

mat2 <- matrix(1:9, ncol=3, byrow=TRUE)
mat2

## -- Eksempel 58
#

v <- c(200, 345, 500, 100, 444)
d <- data.frame(x1=c(1:5), x2=c(6:10))
m <- matrix(1:9, ncol=3)

## -- Eksempel 59
#

minliste <- list(v, d, m)

## -- Eksempel 60
#

minliste

## -- Eksempel 61
#

minliste[3]

## -- Eksempel 62
#

minliste[[3]]

## -- Eksempel 63
#

m1 <- minliste[3] 

## -- Eksempel 64
#

m1[[1]][8]

## -- Eksempel 65
#

m2 <- minliste[[3]] 
m2

## -- Eksempel 66
#

m2[8]

## -- Eksempel 67
#

m2[2,3]

