#' useShinyFeedback
#' 
#' function to load js for using \code{shinyFeedback}
#' 
#' @param feedback boolean: source in JS/CSS to use shinyFeedback functions (Default: TRUE)
#' @param toastr boolean: source in JS/CSS to use showToast functions (Default: TRUE)
#' 
#' @importFrom shiny addResourcePath singleton tags icon
#' 
#' @section Example:
#' \preformatted{
#'   ui <- shinyUI(fluidPage(
#'     useShinyFeedback(
#'       feedback = TRUE,
#'       toastr = TRUE
#'     ),
#'     pageWithSidebar(
#'       headerPanel("Header"),
#'       sidebarPanel(
#'         ...
#'       ),
#'       mainPanel(
#'         ...
#'       )
#'     )
#'   ))
#' }
#' 
#' 
#' @export
#' 
useShinyFeedback <- function(
  feedback = TRUE,
  toastr = TRUE
) {
  
  shiny::addResourcePath("shinyfeedback", system.file("assets", package = "shinyFeedback"))
  
  if (feedback == TRUE && toastr == TRUE) {
    return(
      tags$div(
        shiny::singleton(
          shiny::tags$head(
            shiny::tags$script(
              src = file.path("shinyfeedback", "js", "shinyfeedback.js")
            ),
            shiny::tags$link(
              type = "text/css", 
              rel = "stylesheet", 
              href = file.path("shinyfeedback", "css", "shinyfeedback.css")
            ),
            shiny::tags$script(
              src = file.path("shinyfeedback", "js", "toastr", "toastr.min.js")
            ),
            shiny::tags$link(
              type = "text/css", 
              rel = "stylesheet", 
              href = file.path("shinyfeedback", "css", "toastr", "toastr.min.css")
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
  } else if (feedback != TRUE && toastr == TRUE) {
    return(
      tags$div(
        shiny::singleton(
          shiny::tags$head(
            shiny::tags$script(
              src = file.path("shinyfeedback", "js", "toastr", "toastr.min.js")
            ),
            shiny::tags$link(
              type = "text/css", 
              rel = "stylesheet", 
              href = file.path("shinyfeedback", "css", "toastr", "toastr.min.css")
            )
          )
        )
      )
    )
  } else if (feedback == TRUE && toastr != TRUE) {
    return(
      tags$div(
        shiny::singleton(
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
}
