# shinyFeedback 0.2.0.9000

- added input feedback support for `shiny::fileInput()` (#41)
- updated "shinyWidgets.AirPickerInput" name to reflect the change to `shinyWidgets`
- bug fix to maintain all input styles other than the border style applied by
shinyFeedback when feedback is removed (#36)

# shinyFeedback 0.2.0

- simplified and standardized the JavaScript for showing/hiding input feedback.  
- added input feedback support for the following inputs:
  - `shiny::dateRangeInput()` - Thanks @pcogis!
  - `shinyWidgets::airDatePickerInput()` - Thanks @pcogis!
  - `shinyWidgets::pickerInput()`
- new `loadingButton()` input and `resetLoadingButton()` function.
- new `showToast()` function to show toast notifications.
- new `valueBoxModule` Shiny module.

Breaking Changes: 
- removed `*Snackbar()` functions.  Use the new `showToast()` function instead.

# shinyFeedback 0.1.0

- added basic snackbar notifications
- switched feedback to revert back to actual original label color rather than default `Shiny` label color when removing the feedback from the input. 

# shinyFeedback 0.0.4

- bug fix: feedbacks now properly tracked if the arguments to `feeback*()` are dynamic (#4)

# shinyFeedback 0.0.3

- added checks that throw error if shiny input binding is not supported by shinyFeedback
- displaying feedback based on shiny binding type rather than inferring binding type by DOM structure 

# shinyFeedback 0.0.2

- support for `shiny::selectInput()`
- feedback messages are no longer displayed for non supported `shiny::*Input()`s
- support for multiple feedbacks for a single shiny input
- Font Awesome icons can now be used

# shinyFeedback 0.0.1

- Initial release of shinyFeedback
- feedback() function to conditionally display feedback along side a shiny input
- feedbackWarning(), feedbackDanger(), and feedbackSuccess() functions that wrap the feedback() function with default arguments to display warning, danger, and success messages