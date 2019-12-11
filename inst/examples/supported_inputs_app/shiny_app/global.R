library(shiny)
library(shinyFeedback)



eg_module_ui <- function(id) {
  ns <- NS(id)
  
  numericInput(
    ns("my_input"),
    "Warn if > 10",
    value = 11
  )
}

eg_module <- function(input, output, session) {
  
  observeEvent(input$my_input, {
    
    if (input$my_input > 10) {
      showFeedbackWarning("my_input")
    } else {
      hideFeedback("my_input")
    }
    
  })
}