library(dotar)
context("Physical damage mitigation through armour")

test_that("one armour 6% damred", {
  expect_equal(damred(armour = 0), 0)
  expect_equal(round(damred(1:5), 2), c(0.06, 0.11, 0.15, 0.19, 0.23))
  expect_equal(damred(-25), 3)
})

test_that("hp_multiplier is sensible", {
  expect_equal(hp_multiplier(-30), -0.8)
  expect_equal(hp_multiplier(armour = 0), 1)
})
