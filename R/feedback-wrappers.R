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
#' @import shiny
#' 
#' @export
#' 
#' 
feedbackWarning <- function(inputId, condition, 
                            text = "Ye be warned",
                            color = "#F89406", 
                            icon = shiny::icon("warning-sign", lib="glyphicon")) {
  
  feedback(
    inputId = inputId,
    condition = condition,
    text = text,
    color = color,
    icon = icon
  )
}


#' feedbackDanger
#' 
#' wrapper for \code{feedback()} function that displays a
#' danger message by default
#' 
#' @param inputId the Shiny input's \code{inputId} argument
#' @param condition condition under which feeback is displayed
#' @param text default \code{"Ye be warned"} text string to display below input
#' @param color defailt \code{"#F89406"} the color of the feeback
#' @param icon default \code{icon("warning-sign", lib="glyphicon"))} a \code{shiny::icon} object
#' 
#' @import shiny
#' 
#' @export
#' 
#' 
feedbackDanger <- function(inputId, condition, 
                            text = "Danger, turn back!",
                            color = "#d9534f", 
                            icon = shiny::icon("exclamation-sign", lib="glyphicon")) {
  
  feedback(
    inputId = inputId,
    condition = condition,
    text = text,
    color = color,
    icon = icon
  )
}

#' feedbackSuccess
#' 
#' wrapper for \code{feedback()} function that displays a
#' danger message by default
#' 
#' @param inputId the Shiny input's \code{inputId} argument
#' @param condition condition under which feeback is displayed
#' @param text default \code{"Ye be warned"} text string to display below input
#' @param color defailt \code{"#F89406"} the color of the feeback
#' @param icon default \code{icon("warning-sign", lib="glyphicon"))} a \code{shiny::icon} object
#' 
#' @import shiny
#' 
#' @export
#' 
#' 
feedbackSuccess <- function(inputId, condition, 
                            text = NULL,
                            color = "#5cb85c", 
                            icon = shiny::icon("ok", lib="glyphicon")) {
  
  feedback(
    inputId = inputId,
    condition = condition,
    text = text,
    color = color,
    icon = icon
  )
}