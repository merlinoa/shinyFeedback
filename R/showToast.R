


#' show toast message
#'
#' A wrapper around the `toastr` JavaScript library that uses our preferred default argument
#' values.
#'
#' @param type length 1 character vector.  Valid values are "success", "error", "warning", and "info"
#' @param message the toast message
#' @param title the toast title.  Defaults to \code{NULL}
#' @param keepVisible a logical indicating whether to the notification should remain visible until removed with \code{\link{hideToast}}. \code{FALSE} by default.
#' @param .options other options to pass to the \code{toastr} JavaScript library.  See 
#' \url{https://codeseven.github.io/toastr/demo.html} for a full demo of options.
#' @param session the Shiny session.  Defaults to \code{shiny::getDefaultReactiveDomain()}.
#'
#' @export
#'
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @return `invisible()`
#'
showToast <- function(
  type, 
  message,
  title = NULL,
  keepVisible = FALSE,
  .options = list(
    positionClass = "toast-bottom-center",
    progressBar = TRUE,
    timeOut = 4000,
    closeButton = TRUE,
    
    # same as defaults
    newestOnTop = FALSE,
    preventDuplicates = FALSE,
    showDuration = 300,
    hideDuration = 1000,
    extendedTimeOut = 1000,
    showEasing = "swing",
    hideEasing = "swing",
    showMethod = "fadeIn",
    hideMethod = "fadeOut"
  ), 
  session = shiny::getDefaultReactiveDomain()
) {

  if (isTRUE(keepVisible)) {
    .options$timeOut <- 0
    .options$extendedTimeOut <- 0
  }
  
  session$sendCustomMessage(
    type = "toastr",
    message = list(
      'type' = type,
      'message' = message,
      'title' = title,
      'options' = .options
    )
  )
  
  invisible()
}

