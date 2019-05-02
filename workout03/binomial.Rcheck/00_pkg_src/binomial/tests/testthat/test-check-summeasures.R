context("Check Summary Measures Functions")

test_that("aux_mean equals correct value", {
  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(25, 0.6), 15)
  expect_equal(aux_mean(5, 0.2), 1)
})

test_that("aux_variance equals correct value", {
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(25, 0.6), 6)
  expect_equal(aux_variance(5, 0.2), 0.8)
})

test_that("aux_mode equals correct value", {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_equal(aux_mode(25, 0.6), 15)
  expect_equal(aux_mode(5, 0.2), 1)
})

test_that("aux_skewness equals correct value", {
  expect_equal(aux_skewness(10, 0.3), 0.2760262, tolerance=3e-8)
  expect_equal(aux_skewness(25, 0.6), -0.08164966, tolerance=3e-8)
  expect_equal(aux_skewness(5, 0.2), 0.6708204, tolerance=3e-8)
})

test_that("aux_kurtosis equals correct value", {
  expect_equal(aux_kurtosis(10, 0.3), -0.1238095, tolerance=3e-8)
  expect_equal(aux_kurtosis(25, 0.6), -0.07333333, tolerance=3e-8)
  expect_equal(aux_kurtosis(5, 0.2), 0.05, tolerance=3e-8)
})
