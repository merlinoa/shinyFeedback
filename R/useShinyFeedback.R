#' useShinyFeedback
#' 
#' function to load js for using \code{shinyFeedback}
#' 
#' @import shiny
#' 
#' @export
#' 
useShinyFeedback <- function() {
  
  shiny::addResourcePath("shinyFeedback", system.file("srcjs", package = "shinyFeedback"))
  
  return(
    tags$div(
      shiny::singleton(
        shiny::tags$head(
          shiny::tags$script(
            src = file.path("shinyFeedback", "checkFeedback.js")
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
