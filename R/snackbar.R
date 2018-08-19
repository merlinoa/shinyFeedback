#' snackbar
#' 
#' UI side function to generate the snackbar html.
#' 
#' @param id A length 1 character vector.  The unique id of the snackbar. This needs to match up with
#' the `id` argument specified in the serve side call to `showSnackbar()`.
#' @param message the text message to display in the snackbar
#' 
#' @import shiny
#' 
#' @export
#' 
#' 
snackbar <- function(id, message) {
  shiny::tags$div(
    id = id,
    class = "snackbar",
    message
  )
}


#' showSnackbar
#' 
#' Server side function to show a snackbar.  This function should be called in the expression passed
#' to `shiny::observe()` or `shiny::observeEvent()`.
#' 
#' @param id A length 1 character vector.  A unique id for the snackbar.
#' @param autoHideDuration A length 1 numeric vector.  The abount of time in milliseconds to show the 
#' snackbar (e.g. `3000` is 3 seconds).  Set to NULL to keep snackbar open indefinitely.
#' 
#' @import shiny
#' 
#' @export
#' 
#' @examples 
#' 
#' ## Only run examples in interacive R sessions
#' if (interactive()) {
#'   
#'   ui <- fluidPage(
#'     useShinyFeedback(),
#'     
#'     actionButton(
#'       "showSnackbarBtn",
#'       "Show Snackbar"
#'     ),
#'     
#'     snackbar(
#'       id = "mySnackbar",
#'       message = "Have a snack!"
#'     )
#'   )
#'   
#'   server <- function(input, output) {
#'     observeEvent(input$showSnackbarBtn, {
#'       showSnackbar("mySnackbar")
#'     })
#'   }
#'   
#'   shinyApp(ui, server)
#' }
#' 
showSnackbar <- function(id, autoHideDuration = 3000) {
  
  # get the session
  session <- shiny::getDefaultReactiveDomain()
  
  
  # call js function
  session$sendCustomMessage(
    type = "showSnackbar",
    message = list(
      id = id,
      autoHideDuration = autoHideDuration
    )
  )
  
}