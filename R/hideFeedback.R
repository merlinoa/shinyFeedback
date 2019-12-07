#' hideFeedback
#' 
#' hide feedback next to Shiny input
#' 
#' @param inputId the Shiny input's \code{inputId} argument
#' @param session the \code{shiny} session
#' 
#' @importFrom digest digest
#' @importFrom shiny getDefaultReactiveDomain
#' 
#' @seealso \code{\link{showFeedbackWarning}}, \code{\link{showFeedbackDanger}}, \code{\link{showFeedbackSuccess}}
#' 
#' @export
#' 
#' @examples 
#' 
#' 
hideFeedback <- function(
  inputId,
  session = shiny::getDefaultReactiveDomain()
) {
  
  # some argument checks
  stopifnot(is.character(inputId))

  # call js function
  session$sendCustomMessage(
    type = "hideFeedback",
    message = list(
      inputId = inputId
    )
  )
}
