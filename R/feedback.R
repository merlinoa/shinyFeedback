#' feedback
#' 
#' displays feedback next to Shiny input
#' 
#' @param inputId the Shiny input's \code{inputId} argument
#' @param condition condition under which feeback is displayed
#' @param text text string to display below input
#' @param color the color of the feeback
#' @param icon a \code{shiny::icon} object
#' @param cancelOutput FALSE; whether or not to stop the reactive chain when
#' the \code{condition} argument evaluates to TRUE.  This calls 
#' \code{shiny::req(expr = !condition)} where \code{condition}
#' is the argument passed to \code{feedback}
#' 
#' @import digest
#' @import shiny
#' 
#' @seealso \code{\link{feedbackWarning}}, \code{\link{feedbackDanger}}, \code{\link{feedbackSuccess}}
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
#'       feedback(
#'         "exampleInput",
#'         condition = input$exampleInput < 0,
#'         text = "I am negative",
#'         color = "#d9534f",
#'         icon = shiny::icon("exclamation-sign", lib="glyphicon")
#'       )
#'     })
#'   }
#'   
#'   shinyApp(ui, server)
#' }
#' 
feedback <- function(inputId, condition, text = NULL, color = NULL, 
                     icon = NULL, cancelOutput = FALSE) {
  
  # check that shinyjs and shinyFeedback are set up properly
  
  icon_out <- as.character(icon)
  
  feedbackId <- digest::digest(list(match.call()[[1]], 
                                    inputId,
                                    text,
                                    color,
                                    icon,
                                    cancelOutput))
  
  session <- shiny::getDefaultReactiveDomain()
  # uses shinyjs
  session$sendCustomMessage(
    type = "checkFeedback",
    message = list(
      inputId = inputId,
      condition = condition,
      text = text,
      color = color,
      icon = icon_out,
      feedbackId = feedbackId,
      cancelOutput = cancelOutput
    )
  )
}