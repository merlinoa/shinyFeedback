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
    
    h2("passwordInput")
    
  ),
  
  column(
    width = 4,
    h2("selectInput"),
    
    h2("Selectize = FALSE")
  
  )
  
)