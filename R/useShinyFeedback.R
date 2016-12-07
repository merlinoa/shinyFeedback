#' useShinyFeedback
#' 
#' function to load js for using \code{shinyFeedback}
#' 
#' @export
#' 
useShinyFeedback <- function() {
  system.file("srcjs/checkFeedback.js", package = "shinyFeedback")
}
