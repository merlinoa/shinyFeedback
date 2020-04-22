#' loadingButton
#'
#' Button that becomes disabled until reset w/ `reset_loading_button`
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
#' @importFrom htmltools tags tagList singleton
#' @importFrom jsonlite toJSON
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
    htmltools::singleton(
      # Used personalized kit from FA
      tags$script(src = "https://kit.fontawesome.com/fb4611ff56.js")
    ),
    htmltools::singleton(
      tags$script(src = "shinyfeedback/js/loadingbutton.js")
    ),
    tags$script(sprintf(
      "loadingButtons.create('%s', %s)",
      inputId,
      jsonOptions
    ))
  )
}


#' reset_loading_button
#'
#' Reset the `loading_button` to its original style
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
