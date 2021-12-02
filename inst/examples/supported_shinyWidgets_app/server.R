

function(input, output, session) {
  
  observeEvent(input$myPickerInput, {
    
    if (input$myPickerInput == 'A') {
      
      showFeedbackDanger(
        inputId = "myPickerInput",
        text = "Don't pick A!"
      )  
      
    } else {
      hideFeedback(inputId = "myPickerInput")
    }
    
  })
  
  
  observeEvent(input$myAirDatePickerInput, {
    
    if (input$myAirDatePickerInput != Sys.Date()) {
      
      showFeedbackDanger(
        inputId = "myAirDatePickerInput",
        text = 'not today'
      )  
      
    } else {
      hideFeedback(inputId = "myAirDatePickerInput")
    }
    
  })
  
  observeEvent(input$myCurrencyInput, {
    if (!(input$myCurrencyInput) > 0) {
      
      showFeedbackDanger(
        inputId = "myCurrencyInput",
        text = "Need money!"
      )
      
    } else {
      hideFeedback(inputId = "myCurrencyInput")
    }
    
  })
  
}
