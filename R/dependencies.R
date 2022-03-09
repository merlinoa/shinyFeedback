
#' @importFrom htmltools htmlDependency
#' @importFrom utils packageVersion
feedbackDependency <- function() {
  htmltools::htmlDependency(
    name = "feedback",
    version = utils::packageVersion("shinyFeedback"),
    src = "assets",
    package = "shinyFeedback",
    script = "js/shinyfeedback.js",
    stylesheet = "css/shinyfeedback.css"
  )
}

#' @importFrom htmltools htmlDependency
toastrDependency <- function() {
  htmltools::htmlDependency(
    name = "toastr",
    version = "2.1.4",
    src = "assets/toastr",
    package = "shinyFeedback",
    script = c("js/toastr.min.js", "js/shinytoastr.js"),
    stylesheet = "css/toastr.min.css"
  )
}

#' @importFrom htmltools htmlDependency
#' @importFrom utils packageVersion
valueBoxDependency <- function() {
  htmltools::htmlDependency(
    name = "valueboxmodule",
    version = utils::packageVersion("shinyFeedback"),
    src = "assets",
    package = "shinyFeedback",
    stylesheet = "css/valuebox.css"
  )
}
