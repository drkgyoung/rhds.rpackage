extract.file <- function(tar.file, extract.file, new.file, resultsdir) {
  # get file path to extracted file
  x.file <-
    grep(extract.file,
      utils::untar(tar.file, list = T),
      value = T
    )
}

my.write.table <- function(x, filename) {
  cat("saving", basename(filename), "...\n")
  write.table(x, file = filename, row.names = T, col.names = T, sep = "\t")
}

#' Extract participant ID from TCGA barcode
#' @param id TCGA barcode
#' @return participant ID
#' @export
extract.participant <- function(id) {
  sub("TCGA-[^-]+-([^-]+)-.*", "\\1", id)
}

extract.tissue <- function(id) {
  sub("TCGA-[^-]+-[^-]+-([0-9]+)[^-]+-.*", "\\1", id)
}
