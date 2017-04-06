#' feedbackWarning
#' 
#' wrapper for \code{feedback()} function that displays a
#' warning message by default
#' 
#' @inheritParams feedback
#' @param text default \code{"Ye be warned"} text string to display below input
#' @param color defailt \code{"#F89406"} the color of the feeback
#' @param icon default \code{icon("warning-sign", lib="glyphicon"))} a \code{shiny::icon} object
#' 
#' @import shiny
#' 
#' @family feedback wrappers
#' @seealso \code{\link{feedback}}, \code{\link{feedbackDanger}}, \code{\link{feedbackSuccess}}
#' 
#' @export
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
#'       feedbackWarning(
#'         "exampleInput",
#'         condition = input$exampleInput < 0
#'       )
#'     })
#'   }
#'   
#'   shinyApp(ui, server)
#' }
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
#' @inheritParams feedback
#' @param text default \code{"Danger, turn back"} text string to display below input
#' @param color defailt \code{"#d9534f"} the color of the feeback
#' @param icon default \code{icon("exclamation-sign", lib="glyphicon"))} a \code{shiny::icon} object
#' 
#' @import shiny
#' 
#' @family feedback wrappers
#' @seealso \code{\link{feedback}}, \code{\link{feedbackWarning}}, \code{\link{feedbackSuccess}}
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
#'       feedbackDanger(
#'         "exampleInput",
#'         condition = input$exampleInput < 0
#'       )
#'     })
#'   }
#'   
#'   shinyApp(ui, server)
#' }
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
#' success message by default
#' 
#' @inheritParams feedback
#' @param text default \code{NULL} text string to display below input
#' @param color defailt \code{"#5cb85c"} the color of the feeback
#' @param icon default \code{icon("ok", lib="glyphicon"))} a \code{shiny::icon} object
#' 
#' @import shiny
#' 
#' @family feedback wrappers
#' @seealso \code{\link{feedback}}, \code{\link{feedbackDanger}}, \code{\link{feedbackSuccess}}
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
#'       feedbackSuccess(
#'         "exampleInput",
#'         condition = input$exampleInput < 0
#'       )
#'     })
#'   }
#'   
#'   shinyApp(ui, server)
#' }
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