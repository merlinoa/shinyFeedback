function(input, output, session) {
  
  observeEvent(input$myTextInput, {
    
    if (nchar(input$myTextInput) > 3) {
      
      showFeedbackDanger(
        inputId = "myTextInput",
        text = 'Danger'
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
      
      showFeedbackSuccess(
        inputId = "myTextAreaInput",
        text = 'this is a very very very long text feedback message'
      )  
      
    } else {
      hideFeedback(inputId = "myTextAreaInput")
    }
    
  })
  
  
  observeEvent(input$myNumericInput, {
    req(input$myNumericInput)
    
    if (input$myNumericInput > 10) {
      
      showFeedbackDanger(
        inputId = "myNumericInput",
        text = 'hi'
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
        inputId = "mySliderInput",
        text = "Warning",
        icon = NULL
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
        text = "Danger"
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