# shinyFeedback 0.0.2.9000

# shinyFeedback 0.0.2

- support for `shiny::selectInput()`
- feedback messages are no longer displayed for non supported `shiny::*Input()`s
- support for multiple feedbacks for a single shiny input
- Font Awesome icons can now be used

# shinyFeedback 0.0.1

- Initial release of shinyFeedback
- feedback() function to conditionally display feedback along side a shiny input
- feedbackWarning(), feedbackDanger(), and feedbackSuccess() functions that wrap the feedback() function with default arguments to display warning, danger, and suceess messages