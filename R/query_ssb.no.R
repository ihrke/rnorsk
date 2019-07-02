#' Download data from statistisk sentralbyrå (statistics norway).
#'
#' To download a specific table from SSB, go to
#' https://www.ssb.no/statbank
#' and select an area of interest. For example pick
#' "Utdanning" -> "Høyere Utdanning" -> "Studenter i høyere utdanning"
#' You are going to get a list of related tables, each with a
#' table identifier. Select the one you want to access, for example
#' "05576	Studenter i høyere utdanning i Norge. Kjønn og fagfelt"
#' In the next window, select the cases and variables you are interested in.
#' On the next page, scroll all the way down to "API spørring for denne tabellen".
#' Copy the JSON code that pops up when clicking on this link and paste it
#' into an R-script file as a string using single quotes (') as a string
#' declaration because the JSON string contains double quotes (").
#' See example for details.
#'
#'
#' @export
#' @param tableid ID of an SSB table (as string).
#' @param jsoncode JSON code describing the desired selection from the table. This code can be obtained
#' from
#' @return A data.frame containing the downloaded data.
#' @examples
#'
#' tableid="05576"
#' jsoncode='
#' {
#' "query": [
#'   {
#'     "code": "Kjonn",
#'     "selection": {
#'       "filter": "item",
#'       "values": [
#'         "1",
#'         "2"
#'         ]
#'     }
#'   },
#'   {
#'     "code": "Fagfelt",
#'     "selection": {
#'       "filter": "item",
#'       "values": [
#'         "0",
#'         "1",
#'         "2",
#'         "3",
#'         "4",
#'         "5",
#'         "6",
#'         "7",
#'         "8",
#'         "9"
#'         ]
#'     }
#'   }
#'   ],
#' "response": {
#'   "format": "json-stat2"
#'  }
#'  }'
#' data=get.ssb.dataset(tableid, jsoncode)
#' print(head(data))
#'
get.ssb.dataset <- function(tableid, jsoncode){
  url <- sprintf("https://data.ssb.no/api/v0/no/table/%s", tableid)
  d.tmp <- httr::POST(url, body = jsoncode, encode = "json", httr::verbose())
  # Henter ut innholdet fra d.tmp som tekst deretter bearbeides av fromJSONstat
  sbtabell <- rjstat::fromJSONstat(httr::content(d.tmp, "text"))
  # Henter ut kun datasettet fra sbtabell
  ds <- sbtabell#[[1]]
  return(ds)
}
