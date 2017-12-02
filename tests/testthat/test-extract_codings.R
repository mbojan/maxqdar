context("Testing extract_codings()")

test_that("it works", {
  fname <- system.file("exdata/test.mex")
  expect_silent(
    extract_codings(fname)
  )
})
