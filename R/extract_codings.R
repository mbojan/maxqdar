#' Extract coded text fragments from MEX file
#'
#' Extract all coded text fragments from MAXQDA exchange file included, among
#' other things, start and end character positions of each encoded text
#' fragment.
#'
#' @param fname path to the MEX file
#'
#' @return
#' Data frame with columns:
#'
#' - `ID` - ID of the fragment
#' - `TextID` - ID of the source document
#' - `WordID` - ID of the codeword
#' - `Preview` - First 63 characters of the coded text fragment
#' - `start` - Position of the initial character of the coded text fragment
#' - `end` - Position of the final character of the coded text fragment
#' - `file_name` - Name of the file with the source text
#' - `tag` - Name of the codeword
#' - `preview_length` - Number of characters in the Preview string
#'
#' @import dplyr
#' @export
extract_mex_codings <- function(fname) {
  # Connect to file
  stopifnot(file.exists(fname))
  db <- DBI::dbConnect(RSQLite::SQLite(), fname)
  on.exit(DBI::dbDisconnect(db))

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

  ID <- TextID <- WordID <- Preview <- SegPos1X <- SegPos2X <- Name <- NULL
  rval <- codings %>%
    select(ID, TextID, WordID, Preview, start=SegPos1X, end=SegPos2X) %>%
    left_join(
      select(texts, ID, file_name=Name),
      by = c("TextID"="ID")
    ) %>%
    left_join(
      select(codewords, ID, tag=Name),
      by = c("WordID"="ID")
    ) %>%
    mutate(
      preview_length = nchar(Preview)
    ) %>%
    collect()

  # Check if Preview is 63 chars long
  w <- which(rval$preview_length == 63)
  if(length(w) > 0)
    warning("number of preview strings 63 chars long = ", length(w))

  rval
}
