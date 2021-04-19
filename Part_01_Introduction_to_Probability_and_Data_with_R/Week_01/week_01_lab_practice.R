## 
## Spec: Statistics with R
## 
## Introduction to Probability and Data with R
## 
## Week 01 
## 

install.packages("devtools")
library(devtools) 

install.packages("dplyr")

install.packages("ggplot2")

install.packages("shiny")

install_github("StatsWithR/statsr")


## 
library(dplyr)
library(ggplot2)
library(statsr)


data(arbuthnot)
dim(arbuthnot)

head(arbuthnot)

data(present)

present

plot(arbuthnot$year, arbuthnot$girls)

tail(arbuthnot)


parents
present


present$total <- present$boys + present$girls

present$prop_boys <- present$boys/present$total


plot( present$year, present$prop_boys)


present$more_boys <- ifelse( present$boys>present$girls, TRUE, FALSE)

summary(present$more_boys)

dim(present)


present$prop_boy_girl <- present$boys / present$girls


plot( present$year, present$prop_boy_girl)

max( present$total )

plot( present$year, present$total)


present[which.max( present$total), ]


