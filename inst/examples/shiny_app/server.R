function(input, output, session) {
  
  observeEvent(input$myTextInput, {
    
    if (nchar(input$myTextInput) > 3) {
      
      showFeedback(
        inputId = "myTextInput",
        text = 'hi',
        color = '#FF0000'
      )  
      
    } else {
      hideFeedback(inputId = "myTextInput")
    }
    
  })
  
  
  observeEvent(input$myNumericInput, {
    req(input$myNumericInput)
    
    if (input$myNumericInput > 10) {
      
      showFeedback(
        inputId = "myNumericInput",
        text = 'hi',
        color = '#FF0000'
      )  
      
    } else {
      hideFeedback(inputId = "myNumericInput")
    }
    
  })
  
  observeEvent(input$myPasswordInput, {
    
    
    if (nchar(input$myPasswordInput) > 5) {
      
      showFeedbackSuccess(
        inputId = "myPasswordInput"
      )  
      
    } else {
      hideFeedback(inputId = "myPasswordInput")
    }
    
  })
  
  observeEvent(input$mySelectizeInput, {
    
    if (input$mySelectizeInput == "A") {
      
      showFeedbackWarning(
        inputId = "mySelectizeInput",
        text = "Warn for A"
      )  
      
    } else {
      hideFeedback(inputId = "mySelectizeInput")
    }
    
  })
  
  observeEvent(input$mySelectInput, {
    
    if (input$mySelectInput == "A") {
      
      showFeedbackDanger(
        inputId = "mySelectInput",
        text = "A is Dangerous"
      )  
      
    } else {
      hideFeedback(inputId = "mySelectInput")
    }
    
  })
  
}