#' showFeedback
#' 
#' show feedback next to Shiny input
#' 
#' @param inputId the Shiny input's \code{inputId} argument
#' @param text text string to display below input
#' @param color the color of the feedback
#' @param icon an html icon tag
#' @param session the \code{shiny} session
#' 
#' @importFrom shiny getDefaultReactiveDomain
#' 
#' @seealso \code{\link{showFeedbackWarning}}, \code{\link{showFeedbackDanger}}, \code{\link{showFeedbackSuccess}}
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