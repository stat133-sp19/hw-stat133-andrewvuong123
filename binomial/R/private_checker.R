# private checker function to check validity of probability value (0 <= p <= 1)
check_prob <- function(p) {
  if (p >= 0 & p <= 1) {
    return(TRUE)
  } else {
    stop("invalid prob value")
  }
}


# private checker function to check validity of trial value (non-negative)
check_trials <- function(trials) {
  if (trials >= 0 & trials == floor(trials) ) {
    return(TRUE)
  } else {
    stop("invalid trials value")
  }
}

# private checker function to check validity of success value (0 <=k <= n)
check_success <- function(success, trials) {
  true_count <- 0
  for (i in 1:length(success)) {
    if (success[i] < 0 | success[i] != floor(success[i]) ) {
      stop("invalid success value")
    }
    if (success[i] > trials) {
      stop("success cannot be greater than trials")
    }
    if (success[i] <= trials) {
      true_count <- true_count + 1
    }
  }
  if (true_count == length(success)) {
    return(TRUE)
  }
}
