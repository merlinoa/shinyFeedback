
#' @importFrom htmltools htmlDependency
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
fontAwesomeDependency <- function() {
  htmlDependency(
    "font-awesome", 
    "5.3.1", 
    "www/shared/fontawesome", 
    package = "shiny", 
    stylesheet = c("css/all.min.css", "css/v4-shims.min.css")
  )
}

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
