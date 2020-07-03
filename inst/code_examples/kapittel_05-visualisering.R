
## kapittel_05-visualisering.R
#
# Denne filen inneholder alle kildekoder fra kapittel 5 i
# Mehmetoglu & Mittner (2020). Innføring i R for statistiske dataanalyser. Universitetsforlaget.
##

## setup
library(tidyverse)
library(rnorsk)
theme_set(theme_rnorsk())

## -- Eksempel 1
#

library(rnorsk)
ggplot(nyeStudenter)

## -- Eksempel 2
#

library(dplyr)
ggplot(nyeStudenter, aes(x=aar, y=studenter))

## -- Eksempel 3
#

ggplot(nyeStudenter, aes(x=aar, y=studenter)) + 
  geom_point()

## -- Eksempel 4
#

ggplot(nyeStudenter, aes(x=aar, y=studenter, color=alder)) + 
  geom_point() 

## -- Eksempel 5
#

ggplot(nyeStudenter, aes(x=aar, y=studenter, color=alder,
                         group=interaction(kjoenn,alder))) + 
  geom_point() + 
  geom_line()

## -- Eksempel 6
#

ggplot(nyeStudenter, aes(x=aar, y=studenter, color=alder,
                         shape=kjoenn)) + 
  geom_point() + 
  geom_line(aes(group=interaction(kjoenn,alder))) 

## -- Eksempel 7
#

ggplot(nyeStudenter, aes(x=studenter))+
  geom_histogram(bins = 20)

## -- Eksempel 8
#

ggplot(nyeStudenter, aes(x=studenter, fill=alder))+
  geom_histogram(bins = 20)

## -- Eksempel 9
#

p1 <- ggplot(studentHeights, aes(x=hoeyde))+
  geom_histogram(binwidth=2) 
p2 <- ggplot(studentHeights, aes(x=hoeyde))+
  geom_histogram(binwidth=5)
p3 <- ggplot(studentHeights, aes(x=hoeyde))+
  geom_histogram(binwidth=10)

## -- Eksempel 10
#

library(psych)
ggplot(sat.act, aes(x=education))+geom_bar()

## -- Eksempel 11
#

ggplot(studentHeights, aes(x=hoeyde))+geom_dotplot()

## -- Eksempel 12
#

ggplot(studentHeights, aes(x=hoeyde))+
  geom_dotplot(stackdir="center")

## -- Eksempel 13
#

ggplot(studentHeights, aes(x=hoeyde,fill=kjoenn))+
  geom_dotplot(binpositions = "all", stackgroups = T)

## -- Eksempel 14
#

ggplot(studentHeights, aes(x=hoeyde))+geom_density()

## -- Eksempel 15
#

ggplot(studentHeights, aes(x=hoeyde))+
  geom_histogram(aes(y = stat(density)), binwidth=5)+
  geom_density(color="red")

## -- Eksempel 16
#

ggplot(studentHeights, aes(x=hoeyde,fill=kjoenn))+
  geom_density(alpha=0.4)

## -- Eksempel 17
#

ggplot(studentHeights, aes(x=hoeyde))+
  geom_density(kernel="gaussian", color="blue")+
  geom_density(kernel="triangular", color="red")+
  geom_density(kernel="rectangular", color="green")

## -- Eksempel 18
#

ggplot(studentHeights, aes(x=hoeyde))+
  geom_density(bw=1, color="blue")+
  geom_density(bw=2, color="red")+
  geom_density(bw=10, color="green")

## -- Eksempel 19
#

ggplot(studentHeights, aes(x=hoeyde))+
  geom_density(bw="nrd", color="blue")+
  geom_density(bw="SJ", color="red")+
  geom_density(bw="bcv", color="green")

## -- Eksempel 20
#

ggplot(nyeStudenter, aes(x=studenter))+
  geom_density()+
  geom_rug()

## -- Eksempel 21
#

ggplot(studentHeights, aes(sample=hoeyde))+
  geom_qq()+
  geom_qq_line()

## -- Eksempel 22
#

ggplot(nyeStudenter, aes(sample=studenter))+
  geom_qq()+
  geom_qq_line()

## -- Eksempel 23
#

ggplot(nyeStudenter, aes(sample=studenter, 
                         color=interaction(kjoenn,alder)))+
  geom_qq()+
  geom_qq_line()

## -- Eksempel 24
#

ggplot(sat.act, aes(x=ACT, y=SATQ))+
  geom_point()

## -- Eksempel 25
#

sat.act2 <- filter(sat.act, ACT>10, SATQ>300)
ggplot(sat.act2, aes(x=ACT, y=SATQ))+
  geom_point()

## -- Eksempel 26
#

ggplot(sat.act2, aes(x=jitter(ACT), 
                     y=jitter(SATQ)))+
  geom_point()

## -- Eksempel 27
#

ggplot(sat.act2, aes(x=jitter(ACT), 
                     y=jitter(SATQ)))+
  geom_point(color="grey")+
  geom_smooth()

## -- Eksempel 28
#

ggplot(sat.act2, aes(x=jitter(ACT), 
                     y=jitter(SATQ)))+
  geom_point(color="grey")+
  geom_smooth(method="lm")

## -- Eksempel 29
#

sat.act3 <- filter(sat.act, education==1 | education==5) %>% 
  mutate(education=factor(education, labels=c("low", "high")))

ggplot(sat.act3, aes(x=ACT, y=SATQ,
                     color=education))+
  geom_point()+
  geom_smooth(method="lm", se=F)

## -- Eksempel 30
#

library(GGally)
ggpairs(sat.act, columns = c("age", "ACT", "SATV", "SATQ"))

## -- Eksempel 31
#

sat.act.long <- gather(sat.act,
                       prestasjonsmaal, skaare, 
                       ACT, SATQ, SATV)
head(sat.act.long, 5)

## -- Eksempel 32
#

ggplot(sat.act.long, aes(x=age, y=skaare)) +
  geom_point()+geom_smooth()+
  facet_wrap(~prestasjonsmaal)

## -- Eksempel 33
#

ggplot(sat.act.long, aes(x=age, y=skaare)) +
  geom_point()+geom_smooth()+
  facet_wrap(~prestasjonsmaal, scales="free_y")

## -- Eksempel 34
#

ggplot(sat.act.long, aes(x=age, y=skaare)) +
  geom_point()+geom_smooth()+
  facet_wrap(gender~prestasjonsmaal, scales="free_y")

## -- Eksempel 35
#

ggplot(studentHeights, aes(x=kjoenn, y=hoeyde))+
  geom_boxplot()

## -- Eksempel 36
#

ggplot(studentHeights, aes(x=kjoenn, y=hoeyde))+
  geom_boxplot()+
  geom_dotplot(binaxis = "y", stackdir = "center", 
               fill="grey", alpha=0.3)

## -- Eksempel 37
#

ggplot(studentHeights, 
       aes(x=interaction(kjoenn,aar), y=hoeyde, fill=kjoenn))+
  geom_boxplot()+
  geom_dotplot(binaxis = "y", stackdir = "center", alpha=0.3)+
  coord_flip()

## -- Eksempel 38
#

ggplot(studentHeights, aes(x=aar, y=hoeyde, fill=kjoenn))+
  stat_summary(fun.y=mean, geom="bar", 
               position = position_dodge())

## -- Eksempel 39
#

ggplot(studentHeights, aes(x=aar, y=hoeyde, fill=kjoenn))+
  stat_summary(fun.data=mean_se, geom="errorbar", 
               width=0.3, 
               position = position_dodge(width = 0.9))+
  stat_summary(fun.y=mean, geom="bar", 
               position = position_dodge())+
  coord_cartesian(ylim=c(150,185))

## -- Eksempel 40
#

ggplot(studentHeights, aes(x=factor(aar), y=hoeyde, 
                           color=kjoenn))+
  stat_summary(fun.data=mean_se, geom="pointrange")+
  stat_summary(fun.y=mean, aes(group=kjoenn), geom="line")

## -- Eksempel 41
#

ggplot(nyeStudenter, aes(x=studenter, fill=alder))+
  geom_histogram(bins = 20)+
  theme_dark()

## -- Eksempel 42
#

ggplot(nyeStudenter, aes(x=studenter, fill=alder))+
  geom_histogram(bins = 20)+
  theme_bw()+
  theme(axis.text.x = element_text(size=18))

## -- Eksempel 43
#

ggplot(nyeStudenter, aes(x=studenter, fill=alder))+
  geom_histogram(bins = 20)+
  theme_bw()+
  theme(axis.text.x = element_text(face = "bold", size=18, 
                                   colour="red", angle = 45, 
                                   hjust = 1))+
  theme(axis.text.y = element_text(face = "italic", size=10, 
                                   colour="green", angle = 90, 
                                   hjust = 0.5))

## -- Eksempel 44
#

ggplot(nyeStudenter, aes(x=studenter, fill=alder))+
  geom_histogram(bins = 20)+
  theme(panel.background = element_rect(fill="lightblue"),
        legend.background = element_rect(fill="orange"),
        axis.line = element_line(size = 2, arrow = arrow()),
        panel.grid = element_line(size=0))

## -- Eksempel 45
#

ggplot(nyeStudenter, aes(x=studenter, fill=alder))+
  geom_histogram(bins = 20)+
  scale_fill_manual(values=c("<18"="red",
                             "19-29"="pink",
                             ">30"="orange"))

## -- Eksempel 46
#

ggplot(nyeStudenter, aes(x=studenter, fill=alder))+
  geom_histogram(bins = 20)+
  scale_fill_discrete(labels=c("<18"="unge",
                             "19-29"="unge voksne",
                             ">30"="eldre voksne"))

## -- Eksempel 47
#

ggplot(nyeStudenter, aes(x=studenter, fill=alder))+
  geom_histogram(bins = 20)+
  scale_x_continuous(position="top", 
                     breaks=c(100,1000,10000),
                     labels=c(expression(10^2), expression(10^3),
                              expression(10^4)),
                     trans="log")

## -- Eksempel 48
#

ggplot(nyeStudenter, aes(x=studenter, fill=alder))+
  geom_histogram(bins = 20)+
  labs(title="Antall nye studenter i Norge",
       subtitle="per aldersklasse, år og kjønn",
       tag="A",
       x="Antall nye studenter per år",
       y="Antall år",
       caption="fargekoden beskriver forskjellige aldersklasser; 
        de fleste studentene er mellom 19 og 29 år 
        når de begynner")

## -- Eksempel 49
#

ggplot(nyeStudenter, aes(x=studenter, fill=alder))+
  geom_histogram(bins = 20)+
  annotate("text", x=3000, y=30, color="green", 
           label="unge studenter")+
  annotate("text", x=9000, y=15, color="red", 
           label="eldre studenter")+
  annotate("text", x=20000, y=10, color="blue", 
           label="typisk alder")

## -- Eksempel 50
#

ggplot(nyeStudenter, aes(x=studenter, fill=alder))+
  geom_histogram(bins = 20)+
  annotate("rect", xmin=10000, ymin=-1, xmax=28000, ymax=10, 
           color="blue", alpha=.2)

## -- Eksempel 51
#

outlier <- filter(sat.act, ACT<10 | SATQ<300)

ggplot(sat.act, aes(x=ACT, y=SATQ))+
  geom_point()+
  annotate("point", x=outlier$ACT, y=outlier$SATQ, 
           color="red", size=8, shape="O")

## -- Eksempel 52
#

ggsave("sat_act_plot1.png")

## -- Eksempel 53
#

ggsave("sat_act_plot1.png", path="figurer")

## -- Eksempel 54
#

ggsave("sat_act_plot1.png", width=5, height=3, units="cm")

