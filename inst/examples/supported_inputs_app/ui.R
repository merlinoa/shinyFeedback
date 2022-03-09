fluidPage(
  # include this line at the top of your UI
  useShinyFeedback(),
  
  column(
    width = 4,
    
    h2("textInput"),
    
    textInput(
      inputId = "myTextInput",
      label = "Danger if > 3 chars",
      value = ""
    ),
    
    h2("dateInput"),
    
    dateInput(
      inputId = "myDateInput",
      label = "Danger if not today",
      value = Sys.Date()
    ),
    
    h2("textAreaInput"),
    
    textAreaInput(
      inputId = "myTextAreaInput",
      label = "Success if > 10 chars",
      value = "This is a successful text area input value",
      height = "200px"
    ),
    
    h2("dateRangeInput"),
    
    dateRangeInput(
      inputId = "myDateRangeInput",
      label = "Danger if not after Start"
    )

  ),
  column(
    width = 4,
    h2("numericInput"),
    
    numericInput(
      inputId = "myNumericInput",
      label = "Danger if > 10",
      value = 11
    ),
    
    h2("passwordInput"),
    
    passwordInput(
      inputId = "myPasswordInput",
      label = "Password must be > 5 chars",
      value = ""
    ),
    
    h2("sliderInput"),
    
    sliderInput(
      inputId = "mySliderInput",
      label = "Warn if > 5",
      value = 8,
      min = 0,
      max = 10
    ),
    
    h2("loadingButton"),
    
    loadingButton(
      "myLoadingButton",
      "Submit"
    ),
    
    loadingButton(
      "myLoadingButtonDanger",
      "Cancel",
      class = "btn btn-danger",
      loadingSpinner = "cog",
      loadingLabel = "Cancelling..."
    ),
    br(),
    h2("Remove Toast"),
    actionButton(
      "removeToast",
      "Remove Toast",
      icon = icon("trash-alt")
    ),
    actionButton(
      "removeToastASAP",
      "Remove Toast ASAP",
      icon = icon("trash-alt")
    )
    
  ),
  
  column(
    width = 4,
    h2("selectInput"),
    
    selectizeInput(
      inputId = "mySelectizeInput",
      label = "Warn if A",
      selected = NULL,
      choices = c("A", "B")
    ),
    
    h2("Selectize = FALSE"),
    
    selectInput(
      inputId = "mySelectInput",
      label = "A is Dangerous",
      selected = NULL,
      choices = c("A", "B"),
      selectize = FALSE
    ),
    
    h2("Shiny Module Example"),
    
    eg_module_ui("eg_module"),
    
    h2("fileInput"),
    
    fileInput(
      "myFileInput",
      label = "File Input"
    ),
    
    actionButton(
      "removeFileFeedback",
      "Remove File Feeback"
    )
  
  )
  
)