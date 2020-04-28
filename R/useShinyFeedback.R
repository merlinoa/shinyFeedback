#' useShinyFeedback
#' 
#' function to load js for using \code{shinyFeedback}
#' 
#' @param feedback boolean: source in JS/CSS to use shinyFeedback functions (Default: TRUE)
#' @param toastr boolean: source in JS/CSS to use showToast functions (Default: TRUE)
#'
#' @importFrom shiny addResourcePath icon
#' @importFrom htmltools tags singleton
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
  
  feedback_deps <- NULL
  if (isTRUE(feedback)) {
    feedback_deps <- tagList(
      tags$head(
        feedbackDependency(),
        fontAwesomeDependency()
      )
    )
  }
  
  toastr_deps <- NULL
  if (isTRUE(toastr)) {
    toastr_deps <- tags$div(
      shiny::singleton(
        shiny::tags$head(
          toastrDependency()
        )
      )
    )
  }

  tagList(
    feedback_deps,
    toastr_deps
  )
}
