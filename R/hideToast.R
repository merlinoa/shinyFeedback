

#' Hide existing toast messages
#'
#' @param animate a logical indicating whether to remove the toast message(s) instantly or use its \code{hideMethod} with animations to remove (Default).
#' @param session the Shiny session. Defaults to \code{shiny::getDefaultReactiveDomain()}.
#'
#' @export
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @return `invisible()`
#'
hideToast <- function(
  animate = FALSE,
  session = shiny::getDefaultReactiveDomain()
) {
  
  session$sendCustomMessage(
    type = "hide_toastr",
    message = list(
      'animate' = animate
    )
  )
  
  invisible()
}

