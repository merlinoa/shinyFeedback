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
  
}