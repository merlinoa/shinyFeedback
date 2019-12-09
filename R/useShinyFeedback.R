#' useShinyFeedback
#' 
#' function to load js for using \code{shinyFeedback}
#' 
#' @importFrom shiny addResourcePath singleton tags
#' 
#' @export
#' 
useShinyFeedback <- function() {
  
  shiny::addResourcePath("shinyFeedback", system.file("srcjs", package = "shinyFeedback"))
  shiny::addResourcePath("snackbarCSS", system.file("css", package = "shinyFeedback"))
  
  return(
    tags$div(
      shiny::singleton(
        shiny::tags$head(
          shiny::tags$script(
            src = file.path("shinyFeedback", "showHideFeedback.js")
          ),
          shiny::tags$script(
            src = file.path("shinyFeedback", "snackbar.js")
          ),
          shiny::tags$link(
            type = "text/css", 
            rel = "stylesheet", 
            href = file.path("snackbarCSS", "snackbar.css")
          )
        )
      ),
      # hack to load font-awesome when Shiny loads
      tags$div(
        style = "display: none;",
        shiny::icon("user")
      )
    )
  )
}
