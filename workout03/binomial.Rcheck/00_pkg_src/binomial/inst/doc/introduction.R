## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
library(binomial)

## ---- fig.show='hold'----------------------------------------------------
bin_choose(n = 5, k = 2)

## ---- fig.show='hold'----------------------------------------------------
bin_probability(success = 2, trials = 5, prob = 0.5)
bin_probability(success = 0:3, trials = 5, prob = 0.5)

## ---- fig.show='hold'----------------------------------------------------
dis1 <- bin_distribution(trials = 5, prob = 0.5)

## ---- fig.show='hold'----------------------------------------------------
dis1 <- bin_distribution(trials = 5, prob = 0.5)
plot(dis1)

## ---- fig.show='hold'----------------------------------------------------
dis2 <- bin_cumulative(trials = 5, prob = 0.5)

## ---- fig.show='hold'----------------------------------------------------
dis2 <- bin_cumulative(trials = 5, prob = 0.5)
plot(dis2)

## ---- fig.show='hold'----------------------------------------------------
bin1 <- bin_variable(trials = 10, prob = 0.3)

## ---- fig.show='hold'----------------------------------------------------
bin1 <- bin_variable(trials = 10, prob = 0.3)
bin1

## ---- fig.show='hold'----------------------------------------------------
bin1 <- bin_variable(trials = 10, prob = 0.3)
binsum1 <- summary(bin1)

## ---- fig.show='hold'----------------------------------------------------
bin1 <- bin_variable(trials = 10, prob = 0.3)
binsum1 <- summary(bin1)
binsum1

## ---- fig.show='hold'----------------------------------------------------
bin_mean(n = 10, p = 0.3)
bin_variance(n = 10, p = 0.3)
bin_mode(n = 10, p = 0.3)
bin_skewness(n = 10, p = 0.3)
bin_kurtosis(n = 10, p = 0.3)

