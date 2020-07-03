
## kapittel_12-bayesiansk.R
#
# Denne filen inneholder alle kildekoder fra kapittel 12 i
# Mehmetoglu & Mittner (2020). Innføring i R for statistiske dataanalyser. Universitetsforlaget.
##

## setup
library(tidyverse)
library(rnorsk)
theme_set(theme_rnorsk())

## -- Eksempel 1
#

library(brms)
leilighet2 <- mutate(leilighet, pris=pris/1000.)
mod=brm(pris ~  stoerrelse, data=leilighet2)

## -- Eksempel 2
#

mod <- brm(pris ~  stoerrelse, data=leilighet2, 
           iter=5000, chains=8)

## -- Eksempel 3
#

summary(mod)

## -- Eksempel 4
#

mod.lm <- lm(pris ~ stoerrelse, data=leilighet2)
lm.coef <- coef(mod.lm) 
brms.coef <- fixef(mod)[,1]
# bruk de samme navnene for å kunne sammenligne koeffisientene
names(lm.coef) <- names(brms.coef) 
bind_rows(lm=lm.coef,brm=brms.coef, 
          abs.diff=abs(lm.coef-brms.coef),.id="method") -> tab
tab

## -- Eksempel 5
#

bayes_R2(mod)

## -- Eksempel 6
#

mod.mat <- as.data.frame(mod)
colnames(mod.mat)
dim(mod.mat)

## -- Eksempel 7
#

mod.mat %>% select(-lp__) %>%
  gather(variable, sample) %>%
  ggplot(aes(x=sample))+
    geom_histogram()+
    facet_wrap(~ variable, scales="free")

## -- Eksempel 8
#

library(bayesplot)
params=c("b_Intercept", "b_stoerrelse", "sigma")

mcmc_intervals(mod.mat, pars=params)
mcmc_hist(mod.mat, pars=params)
mcmc_areas(mod.mat, pars=params)
mcmc_dens(mod.mat, pars=params)
mcmc_violin(mod.mat, pars=params)
mcmc_pairs(as.array(mod), pars=params)

## -- Eksempel 9
#

in.interval <- with(mod.mat, b_stoerrelse>30 & b_stoerrelse<40)
sum(in.interval)/length(in.interval)

## -- Eksempel 10
#

hypothesis(mod, "stoerrelse>0")

## -- Eksempel 11
#

mod2 <- brm(pris ~ stoerrelse + beliggenhet, data=leilighet2)
summary(mod2)

## -- Eksempel 12
#

hypothesis(mod2, c("beliggenhet2<0",
                   "beliggenhet3<0",
                   "beliggenhet4<0",
                   "beliggenhet2<beliggenhet3",
                   "beliggenhet2<beliggenhet4",
                   "beliggenhet3<beliggenhet4"))

## -- Eksempel 13
#

bayes_R2(mod,  summary=F)

## -- Eksempel 14
#

mod1.R2 <- as.vector(bayes_R2(mod,  summary=F))
mod2.R2 <- as.vector(bayes_R2(mod2, summary=F))
mod.R2  <- data.frame(mod1.R2,mod2.R2)
mcmc_areas(data.frame(mod1.R2,mod2.R2))

## -- Eksempel 15
#

hypothesis(mod.R2, "mod2.R2>mod1.R2")

## -- Eksempel 16
#

loo1 <- loo(mod)
loo2 <- loo(mod2)
loo_compare(loo1,loo2)

## -- Eksempel 17
#

model_weights(mod,mod2)

## -- Eksempel 18
#

mod1.all <- update(mod,  iter=20000, chains=4, save_all_pars=T)
mod2.all <- update(mod2, iter=20000, chains=4, save_all_pars=T)

## -- Eksempel 19
#

bayes_factor(mod2.all,mod1.all)

## -- Eksempel 20
#

library(BayesFactor)
bf1 <- lmBF(pris ~ stoerrelse, data=leilighet2)
bf2 <- lmBF(pris ~ stoerrelse + beliggenhet, data=leilighet2)
bf2/bf1

## -- Eksempel 21
#

ppred.mod1 <- posterior_predict(mod, nsamples=100)
pris.ekte  <- as.vector(leilighet2$pris)

## -- Eksempel 22
#

ppc_dens_overlay(pris.ekte, ppred.mod1)
ppc_intervals(pris.ekte, ppred.mod1)

## -- Eksempel 23
#

mod3 <- brm(pris ~  stoerrelse, 
            data=leilighet2, family=lognormal())

## -- Eksempel 24
#

ppred.mod3 <- posterior_predict(mod3, nsamples=100)
ppc_dens_overlay(pris.ekte, ppred.mod3)

## -- Eksempel 25
#

loo1 <- loo(mod)
loo3 <- loo(mod3)
loo_compare(loo1,loo3)

## -- Eksempel 26
#

prior_summary(mod)

## -- Eksempel 27
#

mod.1 <- update(mod, 
                prior=c(set_prior("normal(0,50)", class="b")), 
                sample_prior=T)
mod.2 <- update(mod, 
                prior=c(set_prior("normal(0,100)", class="b")), 
                sample_prior=T)
mod.3 <- update(mod, 
                prior=c(set_prior("normal(0,1000)", class="b")), 
                sample_prior=T)

## -- Eksempel 28
#

data.frame(
  mod.1=fixef(mod.1)["stoerrelse",],
  mod.2=fixef(mod.2)["stoerrelse",],
  mod.3=fixef(mod.3)["stoerrelse",]
)

## -- Eksempel 29
#

mod.4 <- update(mod, 
                prior=c(set_prior("normal(0,5)", class="b")), 
                sample_prior=T)

## -- Eksempel 30
#

fixef(mod.4)["stoerrelse",]

## -- Eksempel 31
#

plot(hypothesis(mod.4, "stoerrelse>0"))

