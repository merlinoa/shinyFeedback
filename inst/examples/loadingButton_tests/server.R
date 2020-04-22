server <- function(input, output, session) {
  
  n_loading_buttons <- 0
  
  observeEvent(input$insert, {
    
    id_ <- paste0('insert_btn_', n_loading_buttons)
    
    insertUI(
      selector = "#insert",
      where = "afterEnd",
      ui = tagList(
        loadingButton(
          id_,
          'Insert Button'
        )
      )
    )
    
    n_loading_buttons <<- n_loading_buttons + 1
    
    observeEvent(input[[id_]], {
      Sys.sleep(2)
      resetLoadingButton(id_)
    })
    
  })
  
  observeEvent(input$remove, {
    
    id_ <- paste0('#insert_btn_', n_loading_buttons - 1)
    
    removeUI(
      selector = id_
    )
    
    n_loading_buttons <<- n_loading_buttons - 1
    
    # observeEvent(input[[id_]], {
    #   Sys.sleep(2)
    #   resetLoadingButton(id_)
    # })
    
  })
  
  observeEvent(input$btn, {
    Sys.sleep(2)
    resetLoadingButton("btn")
  })
  
}

# secure_server(server)
