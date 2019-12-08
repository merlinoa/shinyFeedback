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
    
    h2("passwordInput"),
    
    passwordInput(
      inputId = "myPasswordInput",
      label = "Success > 5 chars",
      value = ""
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
      label = "Warn if A",
      selected = NULL,
      choices = c("A", "B"),
      selectize = FALSE
    )
  
  )
  
)