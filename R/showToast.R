# custom configuration for the `shinytoastr::toastr_*()` functions
toast_custom_defaults <- list(
  positionClass = "toast-bottom-center",
  progressBar = TRUE,
  timeOut = 4000,
  closeButton = TRUE,

  # same as defaults
  title = "",
  newestOnTop = FALSE,
  preventDuplicates = FALSE,
  showDuration = 300,
  hideDuration = 1000,
  extendedTimeOut = 1000,
  showEasing = c("swing", "linear"),
  hideEasing = c("swing", "linear"),
  showMethod = c("fadeIn", "slideDown", "show"),
  hideMethod = c("fadeOut", "hide")
)


#' show toast message
#'
#' A wrapper around the `shinytoastr::toast_*()` functions that uses our preferred default argument
#' values.
#'
#' @param type length 1 character vector.  Valid values are "success", "error", "warning", and "info"
#' @param message the toast message
#' @param .options other options to pass to the `shinytoastr::toast_*()` function
#'
#' @export
#'
#' @importFrom shinytoastr toastr_error toastr_success toastr_warning toastr_info
#' @importFrom utils modifyList
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @return `invisible()`
#'
showToast <- function(type, message, .options = list()) {

  args_list <- c(toast_custom_defaults)
  args_out <- utils::modifyList(args_list, .options)

  # function_name <- paste0("toastr_", type)
  # 
  # do.call(function_name, args_out)
  
  # browser()
  
  session <- shiny::getDefaultReactiveDomain()

  session$sendCustomMessage(
    type = "toastr",
    message = list(
      type = type,
      message = message,
      title = title,
      options = args_list
    )
  )
  
  # invisible()
}
