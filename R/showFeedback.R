#' showFeedback
#' 
#' Show feedback next to Shiny inputs.
#' 
#' @param inputId the Shiny input's \code{inputId} argument
#' @param text text string to display below input
#' @param color the color of the feedback
#' @param icon an html icon tag
#' @param session the \code{shiny} session
#' 
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @rdname showFeedback
#'   
#' 
#' @export
#' 
#' @examples 
#' 
#' ## Only run examples in interacive R sessions
#' if (interactive()) {
#'   ui <- fluidPage(
#'     useShinyFeedback(),
#'     
#'     numericInput(
#'       "exampleInput",
#'       "Show Feedback When < 0",
#'       value = -5
#'     )
#'   )
#'   
#'   server <- function(input, output) {
#'     observeEvent(input$exampleInput, {
#'       
#'       if (input$exampleInput < 0) {
#'       
#'         showFeedback(
#'           "exampleInput",
#'           text = "I am negative",
#'           color = "#d9534f",
#'           icon = shiny::icon("exclamation-sign", lib="glyphicon")
#'         )
#'       } else {
#'         hideFeedback("exampleInput")
#'       }
#'       
#'     })
#'   }
#'   
#'   shinyApp(ui, server)
#' }
#' 
showFeedback <- function(
  inputId, 
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
  
  # call js function
  session$sendCustomMessage(
    type = "showFeedback",
    message = list(
      inputId = inputId,
      text = text,
      color = color,
      icon = icon
    )
  )
}



#' showFeedbackWarning
#' 
#' 
#' @rdname showFeedback
#' 
#' @importFrom shiny icon
#' 
#' 
#' @export
#' @examples 
#' 
#' ## Only run examples in interacive R sessions
#' if (interactive()) {
#'   library(shiny)
#'   
#'   ui <- fluidPage(
#'     useShinyFeedback(),
#'     
#'     numericInput(
#'       "exampleInput",
#'       "Show Feedback When < 0",
#'       value = -5
#'     )
#'   )
#'   
#'   server <- function(input, output, session) {
#'     observeEvent(input$exampleInput, {
#'       
#'       if (input$exampleInput < 0) {
#'         showFeedbackWarning("exampleInput")
#'       } else {
#'         hideFeedback("exampleInput")
#'       }
#'       
#'     })
#'   }
#'   
#'   shinyApp(ui, server)
#' }
#' 
showFeedbackWarning <- function(
  inputId, 
  text = "Ye be warned",
  color = "#F89406", 
  icon = shiny::icon("warning-sign", lib="glyphicon")
) {
  
  showFeedback(
    inputId = inputId,
    text = text,
    color = color,
    icon = icon
  )
}


#' showFeedbackDanger
#' 
#' 
#' @importFrom shiny icon
#' 
#' @rdname showFeedback
#' 
#' @export
#' 
showFeedbackDanger <- function(
  inputId,
  text = "Danger, turn back!",
  color = "#d9534f", 
  icon = shiny::icon("exclamation-sign", lib="glyphicon")
) {
  
  showFeedback(
    inputId = inputId,
    text = text,
    color = color,
    icon = icon
  )
}

#' showFeedbackSuccess
#' 
#' 
#' @importFrom shiny icon
#'
#' @rdname showFeedback
#'
#' @export
#'
#' 
showFeedbackSuccess <- function(
  inputId, 
  text = NULL,
  color = "#5cb85c", 
  icon = shiny::icon("ok", lib="glyphicon")
) {
  
  showFeedback(
    inputId = inputId,
    text = text,
    color = color,
    icon = icon
  )
}
