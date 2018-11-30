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
#'   \item{alder}{agegroup, coded are <18, 19-29 and >30}
#'   \item{år}{year}
#'   \item{studenter}{number of new students}
#' }
#' @source \url{https://www.ssb.no/}
"nyeStudenter"

#' Body-height in cm collected from a statistics course at a norwegian university
#' across three years.
#'
#' A dataset containing individual body heights along with a variable for gender and year
#' in which the data was collected.
#'
#'
#' @format A data frame with 99 rows and 3 variables:
#' \describe{
#'   \item{kjønn}{Gender (one of "mann"-male or "kvinne"-female)}
#'   \item{år}{year}
#'   \item{høyde}{body height in cm}
#' }
#' @source \url{}
"studentHeights"

#' Single-trial responses from a Stroop task (85 subjs).
#'
#' A dataset containing individual responses (RT/accuracy) from
#' 85 individuals completing a standard Stroop-task.
#' Raw data and description available at https://osf.io/kxpqu/.
#'
#'
#' @format A data frame with 49309 rows and 9 variables:
#' \describe{
#'   \item{subj}{subject ID}
#'   \item{trial}{trial number in experiment}
#'   \item{color}{color of the presented word}
#'   \item{condition}{one of "neutral" (the presented word was XXXXX), "congruent" (the meaning of the presented
#'   word was identical to the color of the word) and "incongruent" (the meaning of the word was a different color than the
#'   print color of the stimulus)}
#'   \item{correct}{whether the response was correct}
#'   \item{response}{the color indicated by the participant (by button press)}
#'   \item{RT}{reaction time (in sec) between presentation of the stimulus and the response}
#'   \item{age}{participants age at time of data-acquisition}
#'   \item{female}{indicator variable (1=female, 0=male)}
#' }
#' @source \url{https://osf.io/kxpqu/}
"stroop"

