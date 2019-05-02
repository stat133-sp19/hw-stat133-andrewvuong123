context("Check Binomial Functions")

test_that("bin_choose works and fails properly", {
  expect_equal(bin_choose(5, 1:3), c(5, 10, 10))
  expect_error(bin_choose(12, 13))
  expect_equal(bin_choose(10, 4), 210)
})

test_that("bin_probability works and fails properly", {
  expect_equal(bin_probability(55, 100, 0.45), 0.01075277)
  expect_error(bin_probability(-2, 4, 0.5))
  expect_error(bin_probability(5, 0, 0.8))
  expect_error(bin_probability(2, 5, 2))
})

test_that("bin_distribution works and fails properly", {
  bd_df <- bin_distribution(5, 0.5)
  expect_equal(bd_df$probability, c(0.03125,0.15625,0.3125,0.3125,0.15625,0.03125))
  expect_is(bd_df, c('bindis', 'data.frame'))
  expect_error(bin_distribution(-5, 1))
})

test_that("bin_cumulative works and fails properly", {
  bc_df <- bin_cumulative(5, 0.5)
  expect_equal(bc_df$cumulative, c(0.03125,0.18750,0.50000,0.81250,0.96875,1.00000))
  expect_is(bc_df, c('bincum', 'data.frame'))
  expect_error(bin_cumulative(-5, 1))
  expect_error(bin_cumulative(5, 3))
})

