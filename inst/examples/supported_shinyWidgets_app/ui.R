

fluidPage(
  useShinyFeedback(),
  fluidRow(
    column(
      4,
      h2("shinyWidgets::airDatepickerInput"),
      shinyWidgets::airDatepickerInput(
        inputId = "myAirDatePickerInput",
        label = "Danger if not today"
      )
    ),
    column(
      4,
      h2("shinyWidgets::pickerInput"),
      shinyWidgets::pickerInput(
        inputId = "myPickerInput",
        label = "Danger if A",
        choices = c("A", "B"),
        selected = "A"
      )
    ),
    column(
      4,
      h2("shinyWidgets::currencyInput"),
      shinyWidgets::currencyInput(
        inputId = "myCurrencyInput",
        label = "Danger if 0 or less (or empty)",
        format = "dollar",
        value = 100
      )
    )
  )
)
