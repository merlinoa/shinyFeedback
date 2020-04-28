

function(input, output, session) {
  
  observeEvent(input$myPickerInput, {
    
    if (input$myPickerInput == 'A') {
      
      showFeedbackDanger(inputId = "myPickerInput")  
      
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
  
}
