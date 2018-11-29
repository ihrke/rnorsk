#' Number of new students in Norway by year, age and gender
#'
#' A dataset containing the number of new students in Norway by year, age and gender for
#' the years 2000-2017. The data was downloaded from Det Statistiske Sentralbyrå (Statistics
#' Norway) https://www.ssb.no/.
#'
#'
#' @format A data frame with 504 rows and 4 variables:
#' \describe{
#'   \item{kjønn}{Gender (one of "Menn"-male or "Kvinner"-female)}
#'   \item{alder}{agegroup, coded are beginning student <18, each year from 19-29 separately, 30-34 and >35}
#'   \item{alder_grov}{agegroup, coded are only <18, 19-29 and >30}
#'   \item{år}{year}
#'   \item{studenter}{number of new students}
#' }
#' @source \url{https://www.ssb.no/}
"nyeStudenter"


