#' feedback
#' 
#' displays feedback next to Shiny input
#' 
#' @param inputId the Shiny input's \code{inputId} argument
#' @param condition condition under which feeback is displayed
#' @param .text text string to display below input
#' @param .color the color of the feeback
#' @param .icon a \code{shiny::icon} object
#' 
#' @export
#' 
feedback <- function(inputId, condition, text = NULL, color = NULL, 
                     icon = NULL) {
  
  # check that shinyjs and shinyFeedback are set up properly
  
  icon_out <- as.character(icon)
  
  # uses shinyjs
  js$checkFeedback(
    inputId = inputId,
    condition = condition,
    text = text,
    color = color,
    # TODO: 
    # 1. not working with Font Awesome icons for some reason; only Glyphicon
    icon = icon_out
    
  )
  
}