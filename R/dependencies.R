
#' @importFrom htmltools htmlDependency
toastrDependency <- function() {
  htmltools::htmlDependency(
    name = "toastr",
    version = "2.1.4",
    src = "assets",
    package = "shinyFeedback",
    script = "js/toastr/toastr.min.js",
    stylesheet = c("css/toastr/toastr.min.css")#, 
    # "css/fontawesome/webfonts/fa-solid-900.ttf",
    # "css/fontawesome/webfonts/fa-solid-900.woff",
    # "css/fontawesome/webfonts/fa-solid-900.woff2")
  )
}
