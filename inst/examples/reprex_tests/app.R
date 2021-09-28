library(shiny)
# library(shinyFeedback)
devtools::load_all()

ui <- fluidPage(
  shinyFeedback::useShinyFeedback(),
  shiny::numericInput("number", "Input value", value = NULL, 
                      min = 0, max = 4, step = 1)
  
)

server <- function(input, output) {
  
  shiny::observeEvent(input$number, ignoreNULL = FALSE, ignoreInit = TRUE, {
    
    if (is.null(input$number)) {
      err <- NULL
    } else if (input$number %in% 0:3) {
      err <- NULL
    } else {
      err <- paste0(input$number, " not valid")
    }
    
    shinyFeedback::feedbackDanger("number", !is.null(err), err)
  })
  
}

shinyApp(ui = ui, server = server)
