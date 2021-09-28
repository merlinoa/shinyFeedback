library(shiny)
# library(shinyFeedback)
devtools::load_all()

ui <- fluidPage(
  useShinyFeedback(), # include shinyFeedback
  
  # original input from a vignette example
  selectInput(
    "dataset",
    "Dataset",
    choices = c(
      "airquality",
      "Unknown dataset"
    )
  ),
  
  # new select input to try
  selectInput(
    "dataset2",
    "Dataset2",
    choices = c(
      "airquality",
      "Unknown dataset"
    )
  ),
  
  # new select input to try (period in name)
  selectInput(
    "data_set2",
    "Data.set2",
    choices = c(
      "airquality",
      "Unknown dataset"
    )
  ),
  
  tableOutput('data_table')
)

server <- function(input, output, session) {
  
  data_out <- reactive({
    req(input$dataset)
    
    dataset_exists <- exists(input$dataset, "package:datasets")
    feedbackWarning("dataset", !dataset_exists, "Unknown dataset")
    #Apply the same warning to dataset2
    feedbackWarning("dataset2", !dataset_exists, "Unknown dataset")
    #Apply the same warning to data.set2
    feedbackWarning("data_set2", !dataset_exists, "Unknown dataset")
    req(dataset_exists, cancelOutput = TRUE)
    
    get(input$dataset, "package:datasets")
  })
  
  output$data_table <- renderTable({
    head(data_out())
  })
}

shinyApp(ui, server)