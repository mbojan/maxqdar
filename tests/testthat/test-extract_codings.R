context("Testing extract_codings()")

test_that("it works", {
  fname <- system.file(file.path("exdata", "test.mex"), package="maxqdar")
  expect_warning(
    extract_codings(fname)
  )
})
