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
    
    if (is.na(input$my_input)) {
      
      hideFeedback("my_input")
      showFeedbackDanger(
        "my_input",
        text = "required input"
      )
      
    } else if (is.na(input$my_input) || input$my_input > 10) {
      
      hideFeedback("my_input")
      showFeedbackWarning("my_input")
      
    } else {
      hideFeedback("my_input")
    }
    
  })
}