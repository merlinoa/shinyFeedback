#' valueBoxModuleUI
#'
#' @param id the Shiny module id
#' @param subtitle The subtitle to be displayed in the value box
#' @param icon An icon made by the `shiny::icon()`
#' @param backgroundColor A hex color code string
#' @param textColor A hex color code string
#' @param width A number between 1 and 12
#' @param href A url
#' @param iconColor A valid color string
#'
#' @importFrom htmltools tags
#' @importFrom shiny NS
#'
#' @export
#'
valueBoxModuleUI <- function(
  id,
  subtitle,
  icon = NULL, 
  backgroundColor = "#7cb5ec", 
  textColor = "#FFF",
  width = 4, 
  href = NULL, 
  iconColor = "#00000026"
) {
  ns <- shiny::NS(id)

  shiny::addResourcePath("shinyfeedback", system.file("assets", package = "shinyFeedback"))
    
  boxContent <- tags$div(
    class = "sf-small-box",
    style = paste0("background-color: ", backgroundColor, "; color: ", textColor, ";"),
    tags$div(
      class = "sf-inner",
      tags$h3(
        style = "height: 40.91px;",
        shiny::textOutput(ns("value_out"))
      ),
      tags$div(
        tags$p(subtitle),
        style = "font-size: 15px; height: 20.91px; margin-bottom: 10px"
      )
    ),
    if (!is.null(icon)) tags$div(class = "sf-icon-large", style = paste0("color: ", iconColor, ";"), icon)
  )
  
  if (!is.null(href)) boxContent <- tags$a(href = href, boxContent)
  
  tags$div(
    tags$head(
      shiny::singleton(
        valueBoxDependency()
      )
    ),
    class = if (!is.null(width)) paste0("col-sm-", width),
    boxContent
  )
}

#' valueBoxModule
#' 
#' Server function for the `valueBoxModule`.  `valueBoxModule` is similar to 
#' `shinydashboard::valueBox()` but it moves the UI from the server to the ui (
#' i.e. the entire box is not rendered when the value in the value box updates;
#' only the actual value is rerendered).  By moving the box content to the UI 
#' the value box does not flash onto the screen when rendered.  
#' 
#' `valueBoxModule` also allows for more custom styling of the box colors than
#' `shinydashboard::valueBox()`. 
#' 
#' 
#' @param input the Shiny server input
#' @param output the Shiny server output
#' @param session the Shiny server session (Default: getDefaultReactiveDomain())
#' @param value reactive - the value to be displayed in the value box
#'
#' @importFrom shiny getDefaultReactiveDomain reactive is.reactive renderText req
#'
#' @export
#'
valueBoxModule <- function(input, output, session = shiny::getDefaultReactiveDomain(), value) {
  
  if (is.reactive(value)) {
    value_prep <- shiny::reactive({
      if (is.null(value())) "" else value()
    })
  } else {
    value_prep <- shiny::reactive({
      if (is.null(value)) "" else value
    })
  }
  
  output$value_out <- shiny::renderText({
    req(value_prep())  
    value_prep()
  })
  
}