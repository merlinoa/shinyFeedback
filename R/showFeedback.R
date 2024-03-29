#' showFeedback
#' 
#' Show feedback next to Shiny inputs.
#' 
#' @param inputId the Shiny input's \code{inputId} argument
#' @param text text string to display below input
#' @param color the color of the feedback
#' @param icon an html icon tag
#' @param textPosition the CSS position for the div containing the feedback text.  The
#' default is "relative".  Set to "absolute" to keep the text from shifting other 
#' elements on the page.
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
  textPosition = "relative",
  session = shiny::getDefaultReactiveDomain()
) {
  
  # some argument checks
  stopifnot(is.character(inputId))
  icon <- if (!is.null(icon)) as.character(icon)
  stopifnot(is.character(text) || is.null(text))
  stopifnot(is.character(color) || is.null(color))
  
  ns <- session$ns
  
  # call js function
  session$sendCustomMessage(
    type = "showFeedback",
    message = list(
      inputId = ns(inputId),
      text = text,
      color = color,
      icon = icon,
      textPosition = textPosition
    )
  )
}



#' showFeedbackWarning
#' 
#' 
#' @rdname showFeedback
#' 
#' @importFrom shiny icon getDefaultReactiveDomain
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
  icon = shiny::icon("warning-sign", lib = "glyphicon"),
  textPosition = "relative",
  session = shiny::getDefaultReactiveDomain()
) {
  
  showFeedback(
    inputId = inputId,
    text = text,
    color = color,
    icon = icon,
    textPosition = textPosition,
    session = session
  )
}


#' showFeedbackDanger
#' 
#' @importFrom shiny icon getDefaultReactiveDomain
#' 
#' @rdname showFeedback
#' 
#' @export
#' 
showFeedbackDanger <- function(
  inputId,
  text = "Danger, turn back!",
  color = "#d9534f", 
  icon = shiny::icon("exclamation-sign", lib = "glyphicon"),
  textPosition = "relative",
  session = shiny::getDefaultReactiveDomain()
) {
  
  showFeedback(
    inputId = inputId,
    text = text,
    color = color,
    icon = icon,
    textPosition = textPosition,
    session = session
  )
}

#' showFeedbackSuccess
#' 
#' @importFrom shiny icon getDefaultReactiveDomain
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
  icon = shiny::icon("ok", lib = "glyphicon"),
  textPosition = "relative",
  session = shiny::getDefaultReactiveDomain()
) {
  
  showFeedback(
    inputId = inputId,
    text = text,
    color = color,
    icon = icon,
    textPosition = textPosition,
    session = session
  )
}
