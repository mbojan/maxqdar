#' Extract coded text fragments from MER file
#'
#' Extract all coded text fragments from MAXQDA exchange file included, among
#' other things, start and end character positions of each encoded text
#' fragment.
#'
#' @param fname path to the MER file
#'
#' @return
#' Data frame with columns
#'
#' - `ID` - ID of the fragment
#' - `TextID` - ID of the source document
#'
#' @export
extract_codings <- function(fname) {
  # connect to file
  db <- src_sqlite("../../inst/exdata/test.mex")

  # Tables
  codings <-
    db %>%
    tbl("Codings")

  texts <-
    db %>%
    tbl("Texts")

  codewords <-
    db %>%
    tbl("Codewords")

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
    select()
    collect()
}
