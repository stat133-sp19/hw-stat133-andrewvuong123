context("Check Checker Functions")

test_that("check_prob with ok values", {
  expect_true(check_prob(0.5))
  expect_true(check_prob(1))
  expect_true(check_prob(0))
})

test_that("check_prob fails with invalid values", {
  expect_error(check_prob(-1))
  expect_error(check_prob(2))
  expect_error(check_prob(4))
})

test_that("check_prob is of length one", {
  expect_length(check_prob(1), 1)
  expect_length(check_prob(0.5), 1)
  expect_length(check_prob(0.6), 1)
})

test_that("check_trials with ok values", {
  expect_true(check_trials(6))
  expect_true(check_trials(1))
  expect_true(check_trials(2))
})

test_that("check_trials fails with invalid values", {
  expect_error(check_trials(-1))
  expect_error(check_trials(0.5))
  expect_error(check_trials(1.4))
})

test_that("check_trials is of length one", {
  expect_length(check_trials(1), 1)
  expect_length(check_trials(2), 1)
  expect_length(check_trials(6), 1)
})

test_that("check_success with ok values", {
  expect_true(check_success(2, 4))
  expect_true(check_success(c(1,2,3), 4))
  expect_true(check_success(c(1,5,3), 7))
})

test_that("check_success fails with invalid success values", {
  expect_error(check_success(-6, 1))
  expect_error(check_success(c(1,2,3.5), 4))
  expect_error(check_success(c(1,2.3,3), 1))
})

test_that("check_success fails with success greater than trials", {
  expect_error(check_success(5, 1))
  expect_error(check_success(c(1,3), 2))
  expect_error(check_success(c(1,2,5), 2))
})

