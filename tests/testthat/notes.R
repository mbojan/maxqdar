context("Notes")



test_that("It works", {
  skip("Just notes")

  library(dplyr)

  db <- DBI::dbConnect(RSQLite::SQLite(), "inst/exdata/test.mex")

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



extract_codings('inst/exdata/test.mex')

})






test_that("Reading XLS works", {
  skip("Just notes")

  d <- readxl::read_xls("inst/exdata/test.xls")
})




library(dplyr)
db <- DBI::dbConnect(RSQLite::SQLite(), "inst/exdata/test.mex")

db_list_tables(db)

texts <-
  db %>%
  tbl("Texts_PlainTextWin_BLOBS") %>%
  collect()

r <- texts$Value[[2]]
rawToChar(r)

memDecompress( r[-(1:5)], "unknown")

ch <- " 229-  1722, Maio, 28, Lisboa AVISO do secretário de estado, Diogo de Mendonça Corte Real ao governador do Rio de Janeiro, Aires de Saldanha de Albuquerque, ordenando que se dêem os despachos necessários sobre a carta do ouvidor-geral do Rio das Velhas, José de Sousa Valdez e sobre as razões por que soltou os soldados sem serem castigados pelo que fizeram contra o capitão-mor de Vila Real, Lucas Ribeiro de Almeida. Anexo: escrito, carta. Nº de inventário no catálogo: 227. AHU-Minas Gerais, cx. 3, doc. 22. AHU_CU_011, Cx. 3, D. 229."
charToRaw(ch)
