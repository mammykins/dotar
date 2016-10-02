library(dotar)
context("Magical damage and magic resistance")

test_that("Base mag resistance", {
  expect_equal(mag_dam(100), 65)
  expect_equal(mag_dam(300), 195)
})
