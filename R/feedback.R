#' feedback (Defunct)
#' 
#' Show / hide feedback messages.
#' 
#' @inheritParams showFeedback
#' @param show Whether or not the feedback should be shown.  The `show` argument
#' uses `shiny::isTruthy()` to evaluate its value to `TRUE` or `FALSE`.
#' 
#' @importFrom shiny getDefaultReactiveDomain isTruthy
#' 
#' @seealso showFeedback hideFeedback
#' 
#' @export
#' 
#' 
feedback <- function(
  inputId, 
  show, 
  text = NULL, 
  color = NULL, 
  icon = NULL,
  session = shiny::getDefaultReactiveDomain()
) {
  
  # some argument checks
  stopifnot(is.character(inputId))
  icon <- as.character(icon)
  stopifnot(is.character(text) || is.null(text))
  stopifnot(is.character(color) || is.null(color))
  
  session$sendCustomMessage(
    'feedback',
    message = list(
      inputId = inputId, 
      show = shiny::isTruthy(show), 
      text = text, 
      color = color, 
      icon = icon
    )
  )
}

#' feedbackWarning
#'
#' @rdname feedback
#'
#' @export
#' 
feedbackWarning <- function(
  inputId, 
  show, 
  text = "Ye be warned",
  color = "#F89406", 
  icon = shiny::icon("warning-sign", lib="glyphicon")
) {
  
  feedback(
    inputId, 
    show, 
    text,
    color, 
    icon
  )
  
}

#' feedbackDanger
#' 
#'
#' @rdname feedback
#'
#' @export
#' 
feedbackDanger <- function(
  inputId, 
  show, 
  text = "Danger, turn back!",
  color = "#d9534f", 
  icon = shiny::icon("exclamation-sign", lib="glyphicon")
) {
  
  feedback(
    inputId, 
    show, 
    text,
    color, 
    icon
  )
  
}

#' feedbackSuccess
#' 
#'
#' @rdname feedback
#'
#' @export
#' 
feedbackSuccess <- function(
  inputId, 
  show, 
  text = NULL,
  color = "#5cb85c", 
  icon = shiny::icon("ok", lib="glyphicon")
) {
  
  feedback(
    inputId, 
    show, 
    text,
    color, 
    icon
  )
  
}

