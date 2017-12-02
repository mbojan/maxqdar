context("Notes")



test_that("It works", {
  skip("Just notes")

  library(dplyr)

  db <- src_sqlite("../../inst/exdata/test.mex")

  codings <-
  db %>%
    tbl("Codings")

  texts <-
  db %>%
    tbl("Texts")

  codewords <-
    db %>%
    tbl("Codewords")


d <-
  codings %>%
    select(ID, TextID, WordID, Preview, start=SegPos1X, end=SegPos2X) %>%
    left_join(
      select(texts, ID, file_name=Name),
      by=c("TextID"="ID")
      ) %>%
    left_join(
      select(codewords, ID, tag=Name),
      by = c("WordID"= "ID")
    ) %>%
    collect()

})