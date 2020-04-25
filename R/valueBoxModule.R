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
#' @importFrom grDevices rgb
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
  iconColor = grDevices::rgb(0, 0, 0, 0.15)
) {
  ns <- shiny::NS(id)

    
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
    tags$style(
      ".sf-small-box {
        border-radius: 2px;
        position: relative;
        display: block;
        margin-bottom: 20px;
        box-shadow: 0 1px 1px rgba(0,0,0,.1);
      }
      
      .sf-inner {
        padding: 10px;
      }
      
      .sf-small-box .sf-icon-large {
        position: absolute;
        top: auto;
        bottom: 5px;
        right: 5px;
        font-size: 70px;
      }
      
      .sf-small-box h3 {
        font-size: 38px;
        font-weight: 700;
        margin: 0 0 10px 0;
        white-space: nowrap;
        padding: 0;
      }
      "  
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
#' @param session the Shiny server session
#' @param value reactive - the value to be displayed in the value box
#'
#' @importFrom shiny reactive renderText
#'
#' @export
#'
valueBoxModule <- function(input, output, session, value) {
  value_prep <- shiny::reactive({
    if (is.null(value())) "" else value()
  })
  
  output$value_out <- shiny::renderText(value_prep())
}