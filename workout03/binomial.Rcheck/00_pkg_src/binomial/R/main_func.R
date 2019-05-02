#' @title Bin Combination
#' @description Calculates the number of combinations in which k successes can occur in n trials
#' @param n number of trials
#' @param k number of successes
#' @return the combinations of n choose k
#' @export
#' @examples
#' # combination of n=5, k=2
#' combination <- bin_choose(5, 2)
bin_choose <- function(n, k) {
  ifelse(n>=k, ((factorial(n))/(factorial(k)*factorial(n-k))), stop("k cannot be greater than n"))
}

#' @title Bin Probability
#' @description Calculates the probability of getting k successes in n trials assuming the given probability
#' @param trials number of trials
#' @param success number of successes
#' @param prob probability of success
#' @return the probability of success
#' @export
#' @examples
#' # probability of two successes in five trials with a half probability
#' prob <- bin_probability(2, 5, 0.5)
bin_probability <- function(success, trials, prob) {
  if (check_prob(prob) & check_success(success, trials) & check_trials(trials)) {
    return(bin_choose(trials, success) * prob^success * (1-prob)^(trials-success))
  }
}

#' @title Bin Distribution
#' @description Creates a dataframe of the binom prob distribution over n trials
#' @param trials number of trials
#' @param prob probability of success
#' @return a dataframe of two classes bindis and data.frame of the prob distribution
#' @export
#' @examples
#' # probability distribution of five trials with a half probability
#' dist <- bin_distribution(5, 0.5)
bin_distribution <- function(trials, prob) {
  success <- c(0:trials)
  bin_prob <- bin_probability(success, trials, prob)
  df <- data.frame("success" = success, "probability" = bin_prob)
  class(df) <- c("bindis", "data.frame")
  return(df)
}

#' @export
plot.bindis <- function(x, ...) {
  barplot(x$probability, xlab = 'successes', ylab = 'probability', names.arg = x$success, las=1, col=rainbow(20))
}

#' @title Bin Cumulative
#' @description Creates a dataframe of the binom cumulative distribution over n trials
#' @param trials number of trials
#' @param prob probability of success
#' @return a dataframe with both prob distribution and cumulative prob
#' @export
#' @examples
#' # bincum distribution of five trials with a half probability
#' cum <- bin_cumulative(5, 0.5)
bin_cumulative <- function(trials, prob) {
  success <- c(0:trials)
  bin_prob <- bin_probability(success, trials, prob)
  cum_prob <- cumsum(bin_prob)
  df <- data.frame("success" = success, "probability" = bin_prob, "cumulative" = cum_prob)
  class(df) <- c("bincum", "data.frame")
  return(df)
}

#' @export
plot.bincum <- function(x, ...) {
  plot(x$cumulative, type = "o", xlab = 'successes', ylab = 'probability', las=1, col="blue")
}

#' @title Bin Variable
#' @description Creates an object of class binvar that is a binomial random variable
#' @param trials number of trials
#' @param prob probability of success
#' @return a list with named elements trials and prob
#' @export
#' @examples
#' # bin variable of five trials with a half probability
#' var <- bin_variable(5, 0.5)
bin_variable <- function(trials, prob) {
  if (check_trials(trials) & check_prob(prob)) {
    var_list <- list(trials = trials, prob = prob)
    class(var_list) <- c("binvar")
    var_list
  }
}

#' @export
print.binvar <- function(x, ...) {
  cat('"Binomial variable" \n\n')
  cat("Parameters \n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success :", x$prob, "\n")
  invisible(x)
}

#' @export
summary.binvar <- function(x, ...) {
  trials <- x$trials
  prob <- x$prob
  mean <- aux_mean(trials, prob)
  variance <- aux_variance(trials, prob)
  mode <- aux_mode(trials, prob)
  skewness <- aux_skewness(trials, prob)
  kurtosis <- aux_kurtosis(trials, prob)

  sum_list <- list(trials = trials, prob = prob, mean = mean, variance = variance, mode = mode, skewness = skewness, kurtosis = kurtosis)
  class(sum_list) <- c("summary.binvar")
  sum_list
}

#' @export
print.summary.binvar <- function(x, ...) {
  trials <- x$trials
  prob <- x$prob
  mean <- aux_mean(trials, prob)
  variance <- aux_variance(trials, prob)
  mode <- aux_mode(trials, prob)
  skewness <- aux_skewness(trials, prob)
  kurtosis <- aux_kurtosis(trials, prob)

  cat('"Summary Binomial" \n\n')
  cat("Parameters \n")
  cat("- number of trials:", trials, "\n")
  cat("- prob of success :", prob, "\n\n")
  cat("Measures \n")
  cat("- mean    :", mean, "\n")
  cat("- variance:", variance, "\n")
  cat("- mode    :", mode, "\n")
  cat("- skewness:", skewness, "\n")
  cat("- kurtosis:", kurtosis, "\n")
  invisible(x)
}
