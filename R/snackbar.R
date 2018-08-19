#' snackbar
#' 
#' UI side function to generate the snackbar html.
#' 
#' @param id A length 1 character vector.  The unique id of the snackbar. This needs to match up with
#' the \code{id} argument specified in the serve side call to \code{showSnackbar()}.
#' @param message the text message to display in the snackbar
#' @param includeRemoveButton whether or not to show the remove button on the right side of the
#' snackbar
#' @param class A length 1 character vector of CSS classes to add to the snackbar.
#' @param style A length 1 character vector of CSS styles to add to the snackbar.
#' 
#' @import shiny
#' 
#' @export
#' 
#' @seealso \code{\link{showSnackbar}}
#' 
snackbar <- function(id, message, includeRemoveButton = TRUE, class = "", style = "") {
  
  if (includeRemoveButton == TRUE) {
    shiny::tags$div(
      id = id,
      class = paste0("snackbar ", class),
      style = style,
      message,
      tags$span(
        id = paste0(id, "_remove_btn"),
        style = "float: right; margin-left: 10px;",
        tags$i(
          class = "fa fa-times", 
          `aria-hidden` = "true"
        )
      ) 
    )  
  } else {
    shiny::tags$div(
      id = id,
      class = paste0("snackbar ", class),
      style = style,
      message
    )  
  }
  
}


#' showSnackbar
#' 
#' Server side function to show a snackbar.  This function should be called in the expression passed
#' to \code{shiny::observe()} or \code{shiny::observeEvent()}.
#' 
#' @param id A length 1 character vector.  A unique id for the snackbar.
#' @param autoHideDuration A length 1 numeric vector.  The abount of time in milliseconds to show the 
#' snackbar (e.g. \code{3000} is 3 seconds).  Set to NULL to keep snackbar open indefinitely.
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