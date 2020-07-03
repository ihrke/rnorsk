
## kapittel_02-import-data.R
#
# Denne filen inneholder alle kildekoder fra kapittel 2 i
# Mehmetoglu & Mittner (2020). Innføring i R for statistiske dataanalyser. Universitetsforlaget.
##

## setup
library(tidyverse)
library(rnorsk)
theme_set(theme_rnorsk())

## -- Eksempel 1
#

semicol_sep_data <- read.table("semicol_sep_data.txt", 
                               header=TRUE, sep=";")

## -- Eksempel 2
#

View(semicol_sep_data)

## -- Eksempel 3
#

csv_data <- read.table("csv_data.csv", header=TRUE, sep=",")       

## -- Eksempel 4
#

slash_sep_data <- read.table("slash_sep_data.txt", 
                             header=TRUE, sep="/")  

## -- Eksempel 5
#

install.packages("readxl")  

## -- Eksempel 6
#

library(readxl)

## -- Eksempel 7
#

excel_data <- read_excel("excel_data.xlsx")	

## -- Eksempel 8
#

excel_data2 <- read_excel("excel_data.xlsx", sheet=2)	

## -- Eksempel 9
#

install.packages("haven")

## -- Eksempel 10
#

library(haven)

## -- Eksempel 11
#

spss_data <- read_spss("spss_data.sav")	

## -- Eksempel 12
#

install.packages("haven")
library(haven)
stata_data <- read_stata("stata_data.dta") 

## -- Eksempel 13
#

save(loenn_kvinne, file="mydata.Rdata")

## -- Eksempel 14
#

load(file="mydata.Rdata")

## -- Eksempel 15
#

loenn_data <- data.frame(respid=numeric(0), 
                         tloenn=numeric(0),    
                         alder=numeric(0), 
                         kjonn=character(0), 
                         utdann=numeric(0))  

## -- Eksempel 16
#

fix(loenn_data)

## -- Eksempel 17
#

respid <- c(1, 2, 3, 4, 5)
tloenn <- c(270, 330, 655, 445, 150)
alder <- c(34, 46, 51, 39, 22)
kjonn <- c("mann", "kvinne", "mann", "mann", "kvinne")
utdann <- c(10, 12, 15, 13, 8)
loenn_data <- data.frame(respid, tloenn, alder, kjonn, utdann)

## -- Eksempel 18
#

View(loenn_data3)

## -- Eksempel 19
#

remove(alder,kjonn,respid,tloenn,utdann)

## -- Eksempel 20
#

loenn_data <- data.frame(
  respid = c(1, 2, 3, 4, 5),
  tloenn = c(270, 330, 655, 445, 150),
  alder  = c(34, 46, 51, 39, 22),
  kjonn  = c("mann", "kvinne", "mann", "mann", "kvinne"),
  utdann = c(10, 12, 15, 13, 8)
)

## -- Eksempel 21
#

save(loenn_data, file="loenn_data.Rdata")

## -- Eksempel 22
#

load(file="loenn_data.Rdata")

## -- Eksempel 23
#

loenn_data_eng=loenn_data
colnames(loenn_data_eng) <- c("respno","wage","age",
                              "gender","educ")
loenn_data_eng

## -- Eksempel 24
#

mean(loenn_data$alder)

## -- Eksempel 25
#

attach(loenn_data)
mean(alder)
detach("loenn_data")

## -- Eksempel 26
#

with(loenn_data, mean(alder))

## -- Eksempel 27
#

with(loenn_data, {
     print(alder) 
      mean(alder)
})

## -- Eksempel 28
#

loenn_data[,3]

## -- Eksempel 29
#

loenn_data[3,]

## -- Eksempel 30
#

loenn_data[,"alder"]

## -- Eksempel 31
#

lengde <- c(1.78, 1.67, 1.87, 1.99, 2.00)

## -- Eksempel 32
#

class(lengde)

## -- Eksempel 33
#

alder <- c(78L, 67L, 87L, 99L, 100L)
class(alder)   

## -- Eksempel 34
#

as.integer(lengde)

## -- Eksempel 35
#

kjonn <- c("mann", "kvinne", "mann", "mann", "kvinne")                       

## -- Eksempel 36
#

class(kjonn)

## -- Eksempel 37
#

kjonn <- factor(kjonn, levels=c("kvinne", "mann"))
kjonn 

## -- Eksempel 38
#

utdtype <- c("Doktorg","Masterg","Bachelorg",
             "Bachelorg","Videreg")
utdtype <- factor(utdtype, ordered=TRUE,
   levels = c("Ungdoms","Videreg","Bachelorg",
              "Masterg","Doktorg"))
utdtype

## -- Eksempel 39
#

offpriv <- c(2,2,1,1,2)
offpriv <- factor(offpriv, levels=c(1,2),
           labels=c("offentlig","privat"))
offpriv	

