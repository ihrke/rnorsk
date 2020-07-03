
## kapittel_10-logistisk-regresjon.R
#
# Denne filen inneholder alle kildekoder fra kapittel 10 i
# Mehmetoglu & Mittner (2020). Innføring i R for statistiske dataanalyser. Universitetsforlaget.
##

## setup
library(tidyverse)
library(rnorsk)
theme_set(theme_rnorsk())

## -- Eksempel 1
#

prob    <- seq(0,1,by=0.001)
logodds <- log(prob/(1-prob))

## -- Eksempel 2
#

library(rnorsk)
data(titanic)
table(titanic$Survived)

## -- Eksempel 3
#

mod <- glm(Survived ~ Age, family=binomial(link="logit"), 
           data=titanic)

## -- Eksempel 4
#

summary(mod)

## -- Eksempel 5
#

confint(mod)

## -- Eksempel 6
#

koeffisienter <- coef(mod)
koef.intersept <- koeffisienter["(Intercept)"]
plogis(koef.intersept)

## -- Eksempel 7
#

koef.alder <- koeffisienter["Age"]
plogis(koef.alder)

## -- Eksempel 8
#

p.60år <- plogis(koef.intersept + 60*koef.alder)
p.70år <- plogis(koef.intersept + 70*koef.alder)
p.70år - p.60år

## -- Eksempel 9
#

predict(mod, newdata=data.frame(Age=c(60,70)), type="response")

## -- Eksempel 10
#

p.2030år <- predict(mod, newdata=data.frame(Age=c(20,30)), 
                    type="response")
diff(p.2030år)

## -- Eksempel 11
#

library(visreg)
visreg(mod)
visreg(mod, scale="response")

## -- Eksempel 12
#

library(lmtest)
lrtest(mod)

## -- Eksempel 13
#

library(DescTools)
PseudoR2(mod, which="all")

## -- Eksempel 14
#

mod2 <- glm(Survived ~ Sex+Age, 
            family=binomial(link='logit'), 
            data=titanic)
summary(mod2)

## -- Eksempel 15
#

lrtest(mod, mod2)

## -- Eksempel 16
#

rbind(
  alder          = PseudoR2(mod,  which = "Nagelkerke"), 
  alder.og.kjønn = PseudoR2(mod2, which = "Nagelkerke"))

## -- Eksempel 17
#

koeff <- coef(mod2)
p.kvinner <- plogis( koeff["(Intercept)"] )
p.menn    <- plogis( koeff["(Intercept)"]+koeff["Sexmale"] )
cat(p.kvinner,p.menn)

## -- Eksempel 18
#

visreg(mod2, scale ="response")

## -- Eksempel 19
#

mod3 <- glm(Survived ~ Sex+Age+Sex:Age, 
            family=binomial(link='logit'), 
            data=titanic)

## -- Eksempel 20
#

lrtest(mod,mod2,mod3)

rbind(
  alder             = PseudoR2(mod, which = "Nagelkerke"), 
  alder.og.kjønn    = PseudoR2(mod2, which = "Nagelkerke"),
  alder.og.kjønn.ia = PseudoR2(mod3, which = "Nagelkerke"))

## -- Eksempel 21
#

summary(mod3)$coefficients

## -- Eksempel 22
#

visreg(mod3, xvar = "Age", by="Sex",scale="response")

## -- Eksempel 23
#

table(titanic$Pclass)

## -- Eksempel 24
#

class(titanic$Pclass)

## -- Eksempel 25
#

mod4 <- glm(Survived ~ Sex*Age + Pclass, 
            family=binomial(link='logit'),
            data=titanic)

## -- Eksempel 26
#

lrtest(mod3,mod4)

rbind(
  alder.og.kjønn.ia        = PseudoR2(mod3, which = "Nagelkerke"),
  alder.og.kjønn.ia.pclass = PseudoR2(mod4, which = "Nagelkerke"))

## -- Eksempel 27
#

summary(mod4)$coefficients

## -- Eksempel 28
#

d <- expand.grid(Age=seq(0,80),
                 Sex=c("female","male"),
                 Pclass=c(1,2,3))

## -- Eksempel 29
#

library(modelr)
dpred <- d %>% add_predictions(model=mod4, type="response")

## -- Eksempel 30
#

ggplot(dpred, aes(x=Age,y=pred,color=Sex))+
  geom_line()+
  facet_wrap( ~ Pclass)

## -- Eksempel 31
#

mod5 <- glm(Survived ~ Sex*Age * Pclass, 
            family=binomial(link='logit'), 
            data=titanic)

## -- Eksempel 32
#

lrtest(mod4, mod5)
rbind(
  alder.kjønn.pclass    = PseudoR2(mod4, which = "Nagelkerke"),
  alder.kjønn.pclass.ia = PseudoR2(mod5, which = "Nagelkerke"))

## -- Eksempel 33
#

dpred2 <- d %>% 
  add_predictions(var = "mod4", model=mod4, type="response") %>%
  add_predictions(var = "mod5", model=mod5, type="response")

## -- Eksempel 34
#

dpred2 %>% 
  gather(model, pred, mod4, mod5) %>%
  ggplot(aes(x=Age,y=pred,color=model))+
    geom_line()+facet_grid(Sex ~ Pclass)


## -- Eksempel 35
#

titanic.complete <- na.omit(titanic, cols=c("Survived", "Age", 
                                            "Sex", "Pclass"))

## -- Eksempel 36
#

ntotal <- nrow(titanic.complete)
ntrain <- floor(0.75*ntotal)
ntest  <- ntotal-ntrain

## -- Eksempel 37
#

train.ix <- sample.int(n=ntotal, size = ntrain, replace = F)

## -- Eksempel 38
#

titanic.train <- titanic.complete[ train.ix,]
titanic.test  <- titanic.complete[-train.ix,]

## -- Eksempel 39
#

mod.train <- glm(Survived ~ Sex*Age * Pclass, 
                 family=binomial(link='logit'), 
                 data=titanic.train)

## -- Eksempel 40
#

titanic.test.pred <- add_predictions(data = titanic.test, 
                                     model= mod.train,
                                     var  = "pred.sannsynlighet",  
                                     type = "response")

## -- Eksempel 41
#

titanic.test.pred <- titanic.test.pred %>% 
  mutate(pred.Survived = 
           case_when(pred.sannsynlighet>0.5 ~ 1,
                                          T ~ 0))

## -- Eksempel 42
#

with(titanic.test.pred, table(Survived, pred.Survived))

## -- Eksempel 43
#

library(caret)
predikert <- factor(titanic.test.pred$pred.Survived, 
                    labels=c("doede", "overlevde"))
overlevde <- factor(titanic.test.pred$Survived,      
                    labels=c("doede", "overlevde"))
confusionMatrix(predikert, overlevde)

## -- Eksempel 44
#

library(plotROC)
 
ggplot(titanic.test.pred, aes(d=Survived, m=pred.sannsynlighet))+
  geom_roc()

## -- Eksempel 45
#

p <- ggplot(titanic.test.pred, aes(d=Survived, 
                                   m=pred.sannsynlighet))+
  geom_roc()
calc_auc(p)[["AUC"]]

## -- Eksempel 46
#

library(broom)
library(modelr)
library(purrr)

titanic.complete %>% crossv_kfold(k=10) %>%   
  mutate(mod=map(train, ~ glm(Survived ~ Sex*Age * Pclass, 
                              family=binomial(link='logit'), 
                              data=.))) %>%
  mutate(predicted = map2(mod, test, 
                          ~ augment(.x, newdata = .y, 
                                    type.predict="response"))) %>%
  mutate(andel.korrekt=map(predicted, function(df) { 
    df %>% mutate(pred=.fitted>0.5, 
                  correct=(Survived==pred)) %>% 
      pull(correct) %>% sum(na.rm=T)/(dim(df)[1]) 
    })) %>% unnest(andel.korrekt) %>% pull(andel.korrekt) -> 
  andel.korrekt
andel.korrekt

## -- Eksempel 47
#

summary(andel.korrekt)

