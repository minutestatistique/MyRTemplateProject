library(testthat)

context("My test")

test_that("Dummy test works", {
  expect_true(1 + 1 == 2)
  m1 <- matrix(1:4, 2, 2)
  m2 <- m1 * 2
  expect_equivalent(matrix(1:4 * 2, 2, 2), m2)
})
