#' loadingButton
#'
#' Button that becomes disabled until reset w/ `resetLoadingButton`
#'
#' @param inputId the input id
#' @param label the button text (label)
#' @param class the class(es) to apply to the button
#' @param style style for button (pre-loading); character string w/ CSS styling format: "color: black; background-color: red;"
#' @param loadingLabel text to show after button is clicked (e.g. during loading)
#' @param loadingSpinner the loading spinner icon.  Valid values are NULL, "spinner", "circle-notch",
#' "sync", and "cog"
#' @param loadingClass the loading button css class(es).
#' @param loadingStyle style for button (while loading); character string w/ CSS styling format: "color: black; background-color: red;"
#'
#' @export
#'
#' @importFrom htmltools span tags singleton
#' @importFrom jsonlite toJSON
#' @importFrom fontawesome fa_html_dependency
#' @importFrom shiny addResourcePath
#'
loadingButton <- function(
  inputId,
  label,
  class = "btn btn-primary",
  style = "width: 150px;",
  loadingLabel = "Loading...",
  loadingSpinner = "spinner",
  loadingClass = NULL,
  loadingStyle = NULL
) {
  
  shiny::addResourcePath("shinyfeedback", system.file("assets", package = "shinyFeedback"))
  
  # if NULL, set loading class and stye to same as active button
  if (is.null(loadingClass)) loadingClass <- class
  if (is.null(loadingStyle)) loadingStyle <- style
  
  rOptions <- list(
    "label" = label, 
    "class" = class,
    "style" = style,
    "loadingLabel" = loadingLabel,
    "loadingSpinner" = loadingSpinner,
    "loadingClass" = loadingClass,
    "loadingStyle" = loadingStyle
  )
  
  
  
  jsonOptions <- jsonlite::toJSON(rOptions, auto_unbox = TRUE)
  
  htmltools::span(
    class = "sf-loading-button",
    id = paste0("sf-loading-button-", inputId),
    tags$button(
      id = inputId,
      class = class,
      style = style,
      label
    ),
    tags$head(
      htmltools::singleton(
        fontawesome::fa_html_dependency()
      ),
      htmltools::singleton(
        tags$script(src = "shinyfeedback/js/loadingbutton.js?version=1"),
      ),
      tags$script(sprintf(
        "loadingButtons.create('%s', %s)",
        inputId,
        jsonOptions
      ))
    )
    
  )
}


#' resetLoadingButton
#'
#' Reset the `loadingButton` to its original style
#'
#' @param inputId the input id
#' @param session the shiny session
#'
#' @export
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
resetLoadingButton <- function(inputId, session = shiny::getDefaultReactiveDomain()) {
  
  session$sendCustomMessage(
    'resetLoadingButton',
    message = list(
      inputId = session$ns(inputId)
    )
  )
}
