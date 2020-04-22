ui <- fluidPage(
  fluidRow(
    column(
      12,
      tagList(
        h1("Test App"),
        loadingButton(
          'btn',
          'Loading Button'#,
          # style = "color: black; background-color: green; border-color: green;",
          # loadingStyle = "color: black; background-color: red; border-color: red;"
        ),
        actionButton(
          'insert',
          'Insert Loading Button'
        ),
        actionButton(
          'remove',
          'Remove Loading Button'
        )
        # loadingButton(
        #   'btn_2',
        #   'Insert Button'
        # ),
        # actionButton(
        #   'reset_2',
        #   'Reset Insert'
        # ),
      )
    )
  )
)

# secure_ui(
#   ui,
#   firebase_config = config$firebase
# )
