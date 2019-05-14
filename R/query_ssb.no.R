#' Download data from statistisk sentralbyrå (statistics norway).
#'
#' @export
#' @param tableid ID of an SSB table (as string).
#' @param jsoncode JSON code describing the desired selection from the table. This code can be obtained
#' from
#' @return A data.frame containing the downloaded data.
#' @examples
#' add(1, 1)
#' add(10, 1)
get.ssb.dataset <- function(tableid, jsoncode){
  url <- sprintf("https://data.ssb.no/api/v0/no/table/%s", tableid)
  d.tmp <- httr::POST(url, body = jsoncode, encode = "json", httr::verbose())
  # Henter ut innholdet fra d.tmp som tekst deretter bearbeides av fromJSONstat
  sbtabell <- rjstat::fromJSONstat(httr::content(d.tmp, "text"))
  # Henter ut kun datasettet fra sbtabell
  ds <- sbtabell[[1]]
  return(ds)
}
