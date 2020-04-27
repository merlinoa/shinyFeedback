
#' @importFrom htmltools htmlDependency
fontAwesomeDependency <- function() {
  htmltools::htmlDependency(
    name = "font-awesome",
    version = "5.13.0",
    src = "assets",
    package = "shinyFeedback",
    script = "js/fontawesome/all.js",
    stylesheet = c("css/fontawesome/all.css")#, 
                   # "css/fontawesome/webfonts/fa-solid-900.ttf",
                   # "css/fontawesome/webfonts/fa-solid-900.woff",
                   # "css/fontawesome/webfonts/fa-solid-900.woff2")
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
