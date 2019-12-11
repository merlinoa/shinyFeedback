#' hideFeedback
#' 
#' hide feedback next to Shiny input
#' 
#' @param inputId the Shiny input's \code{inputId} argument
#' @param session the \code{shiny} session
#' 
#' @importFrom shiny getDefaultReactiveDomain
#' 
#' @export
#' 
#' 
hideFeedback <- function(
  inputId,
  session = shiny::getDefaultReactiveDomain()
) {
  
  # some argument checks
  stopifnot(is.character(inputId))
  
  ns <- session$ns
  
  # call js function
  session$sendCustomMessage(
    type = "hideFeedback",
    message = list(
      inputId = ns(inputId)
    )
  )
}
