#' showFeedbackWarning
#' 
#' Wrappers for the \code{showFeedback()} function that display
#' danger, warning, and success messages.
#' 
#' @inheritParams showFeedback
#' 
#' @rdname showFeedback-wrappers
#' 
#' @importFrom shiny icon
#' 
#' @family showFeedback wrappers
#' @seealso \code{\link{showFeedback}}
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
#' @rdname showFeedback-wrappers
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
#' @rdname showFeedback-wrappers
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
