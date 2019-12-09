#' feedback (Defunct)
#' 
#' These functions have been removed from `shinyFeedback`.  Use `\link{showFeedback}()` 
#' and `\link{hideFeedback}()` instead.
#' 
#' @param inputId the Shiny input's \code{inputId} argument
#' @param condition condition under which feedback is displayed
#' @param text text string to display below input
#' @param color the color of the feedback
#' @param icon a \code{shiny::icon} object
#' 
#' 
#' @export
#' 
#' 
feedback <- function(inputId, condition, text = NULL, color = NULL, 
                     icon = NULL) {
  
  .Defunct(msg = "`feedback()` has been removed from `shinyFeedback`. Use `showFeedback()` and `hideFeedback()` instead.")
  
}

#' feedbackWarning
#'
#' @rdname feedback
#'
#' @export
#' 
feedbackWarning <- function(inputId, condition, text = NULL, color = NULL, 
                     icon = NULL) {
  
  feedback(
    "placeholder_id",
    "placeholder_condition"
  )
  
}

#' feedbackDanger
#' 
#'
#' @rdname feedback
#'
#' @export
#' 
feedbackDanger <- function(inputId, condition, text = NULL, color = NULL, 
                            icon = NULL) {
  
  feedback(
    "placeholder_id",
    "placeholder_condition"
  )
  
}

#' feedbackSuccess
#' 
#'
#' @rdname feedback
#'
#' @export
#' 
feedbackSuccess <- function(inputId, condition, text = NULL, color = NULL, 
                            icon = NULL) {
  
  feedback(
    "placeholder_id",
    "placeholder_condition"
  )
  
}

