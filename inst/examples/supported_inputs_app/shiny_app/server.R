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
  
  observeEvent(input$myDateInput, {
    
    if (input$myDateInput != Sys.Date()) {
      
      showFeedbackDanger(
        inputId = "myDateInput",
        text = 'not today'
      )  
      
    } else {
      hideFeedback(inputId = "myDateInput")
    }
    
  })
  
  observeEvent(input$myTextAreaInput, {
    
    if (nchar(input$myTextAreaInput) > 10) {
      
      showFeedbackDanger(
        inputId = "myTextAreaInput",
        text = 'not today'
      )  
      
    } else {
      hideFeedback(inputId = "myTextAreaInput")
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
  
  
  observeEvent(input$mySliderInput, {
    
    if (input$mySliderInput > 5) {
      
      showFeedbackWarning(
        inputId = "mySliderInput"
      )  
      
    } else {
      hideFeedback(inputId = "mySliderInput")
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
  
  
  callModule(
    eg_module,
    "eg_module"
  )
}