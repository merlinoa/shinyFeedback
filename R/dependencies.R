
#' @importFrom htmltools htmlDependency
toastrDependency <- function() {
  htmltools::htmlDependency(
    name = "toastr",
    version = "2.1.4",
    src = "assets",
    package = "shinyFeedback",
    script = c("js/toastr/toastr.min.js", "js/shinytoastr.js"),
    stylesheet = "css/toastr/toastr.min.css"
  )
}
