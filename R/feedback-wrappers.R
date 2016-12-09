#' feedbackWarning
#' 
#' wrapper for \code{feedback()} function that displays a
#' warning message by default
#' 
#' @param inputId the Shiny input's \code{inputId} argument
#' @param condition condition under which feeback is displayed
#' @param text default \code{"Ye be warned"} text string to display below input
#' @param color defailt \code{"#F89406"} the color of the feeback
#' @param icon default \code{icon("warning-sign", lib="glyphicon"))} a \code{shiny::icon} object
#' 
#' @export
#' 
feedbackWarning <- function(inputId, condition, 
                            text = "Ye be warned",
                            color = "#F89406", 
                            icon = icon("warning-sign", lib="glyphicon")) {
  
  feedback(
    inputId = force(inputId),
    condition = foce(condition),
    text = force(text),
    color = force(color),
    icon = force(icon)
  )
}
