#' snackbarSuccess
#' 
#' This is a wrapper for \code{\link{snackbar}}.  It provides green success styling for the snackbar.
#' 
#' @param id A length 1 character vector.  The unique id of the snackbar. This needs to match up with
#' the \code{id} argument specified in the serve side call to \code{showSnackbar()}.
#' @param message the text message to display in the snackbar
#' @param includeRemoveButton whether or not to show the remove button on the right side of the
#' snackbar
#' 
#' @family snackbar wrappers
#' 
#' @import shiny
#' 
#' @export
#' 
#' @seealso \code{\link{showSnackbar}}
#' 
snackbarSuccess <- function(id, message, includeRemoveButton = TRUE) {
  
  snackbar(
    id = id, 
    message = message, 
    includeRemoveButton = includeRemoveButton,
    class = "snackbar_success"
  )
  
}

#' snackbarWarning
#' 
#' This is a wrapper for \code{\link{snackbar}}.  It provides yellow warning styling for the snackbar.
#' 
#' @param id A length 1 character vector.  The unique id of the snackbar. This needs to match up with
#' the \code{id} argument specified in the serve side call to \code{showSnackbar()}.
#' @param message the text message to display in the snackbar
#' @param includeRemoveButton whether or not to show the remove button on the right side of the
#' snackbar
#' 
#' @family snackbar wrappers
#' 
#' @import shiny
#' 
#' @export
#' 
#' @seealso \code{\link{showSnackbar}}
#' 
snackbarWarning <- function(id, message, includeRemoveButton = TRUE) {
  
  snackbar(
    id = id, 
    message = message, 
    includeRemoveButton = includeRemoveButton,
    class = "snackbar_warning"
  )
  
}



#' snackbarDanger
#' 
#' This is a wrapper for \code{\link{snackbar}}.  It provides red danger/error styling for the snackbar.
#' 
#' @param id A length 1 character vector.  The unique id of the snackbar. This needs to match up with
#' the \code{id} argument specified in the serve side call to \code{showSnackbar()}.
#' @param message the text message to display in the snackbar
#' @param includeRemoveButton whether or not to show the remove button on the right side of the
#' snackbar
#' 
#' @family snackbar wrappers
#' 
#' @import shiny
#' 
#' @export
#' 
#' @seealso \code{\link{showSnackbar}}
#' 
snackbarDanger <- function(id, message, includeRemoveButton = TRUE) {
  
  snackbar(
    id = id, 
    message = message, 
    includeRemoveButton = includeRemoveButton,
    class = "snackbar_danger"
  )
  
}

