

library(statsr)
library(dplyr)
library(ggplot2)

data("kobe_basket")

head(kobe_basket, 8)
kobe_streak <- calc_streak(kobe_basket$shot)

kobe_streak <- as.numeric( as.vector(kobe_streak) )

IQR(kobe_streak$length)
kobe_streak$length

median(kobe_streak$length)


max( kobe_streak$length)

mean(kobe_streak$length)

# mean > median, so, the distribution is right screwed. 

(0.51^2 ) * 0.49 * 3 

0.49^2 * 3
