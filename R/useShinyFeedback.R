#' useShinyFeedback
#' 
#' function to load js for using \code{shinyFeedback}
#' 
#' @param feedback boolean: source in JS/CSS to use shinyFeedback functions (Default: TRUE)
#' @param toastr boolean: source in JS/CSS to use showToast functions (Default: TRUE)
#'
#' @importFrom htmltools tagList
#' @importFrom fontawesome fa_html_dependency
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
    feedback_deps <- htmltools::tagList(
      feedbackDependency(),
      fontawesome::fa_html_dependency()
    )
  }
  
  toastr_deps <- NULL
  if (isTRUE(toastr)) {
    toastr_deps <- toastrDependency()
  }

  htmltools::tagList(
    feedback_deps,
    toastr_deps
  )
}
