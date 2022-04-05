#' valueBoxModuleUI
#'
#' @param id the Shiny module id
#' @param subtitle The subtitle to be displayed in the value box.  Set to "__server__" to
#' dynamically render the subtitle from the server.
#' @param icon An icon made by the `shiny::icon()`
#' @param backgroundColor A hex color code string
#' @param textColor A hex color code string
#' @param width A number between 1 and 12
#' @param href A url
#' @param iconColor A valid color string
#'
#' @importFrom htmltools singleton tags
#' @importFrom shiny NS textOutput
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
  
  if (identical(subtitle, "__server__")) {
    subtitle_out <- shiny::textOutput(ns("subtitle"))  
  } else {
    subtitle_out <- subtitle
  }
   
  
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
        tags$p(subtitle_out),
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
#' @param session the Shiny server session
#' @param value Either a reactive or an R object that can be coerced into a string.
#' The value to be displayed in the value box.
#' @param subtitle reactive to dynamically set the subtitle.  Set the "subtitle" argument
#' of \code{valueBoxModuleUI()} to \code{"__server__"} to display this subtitle.
#'
#' @importFrom shiny reactive is.reactive renderText
#'
#' @export
#'
valueBoxModule <- function(input, output, session, value, subtitle = function() NULL) {
  
  
  value_prep <- shiny::reactive({
    if (shiny::is.reactive(value)) {
      out <- value()
    } else {
      out <- value
    }
      
    out
  })
  
  output$value_out <- shiny::renderText({
    value_prep()
  })
  
  output$subtitle <- shiny::renderText({
    subtitle()
  })
  
}