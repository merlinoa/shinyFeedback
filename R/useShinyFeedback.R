#' useShinyFeedback
#' 
#' function to load js for using \code{shinyFeedback}
#' 
#' @importFrom shiny addResourcePath icon
#' @importFrom htmltools tags singleton
#' 
#' @export
#' 
useShinyFeedback <- function() {
  
  shiny::addResourcePath("shinyfeedback", system.file("assets", package = "shinyFeedback"))
  
  return(
    tags$div(
      htmltools::singleton(
        shiny::tags$head(
          shiny::tags$script(
            src = file.path("shinyfeedback", "js", "shinyfeedback.js")
          ),
          shiny::tags$link(
            type = "text/css", 
            rel = "stylesheet", 
            href = file.path("shinyfeedback", "css", "shinyfeedback.css")
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
