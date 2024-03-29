% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/feedback.R
\name{feedback}
\alias{feedback}
\alias{feedbackWarning}
\alias{feedbackDanger}
\alias{feedbackSuccess}
\title{feedback}
\usage{
feedback(
  inputId,
  show,
  text = NULL,
  color = NULL,
  icon = NULL,
  textPosition = "relative",
  session = shiny::getDefaultReactiveDomain()
)

feedbackWarning(
  inputId,
  show,
  text = "Ye be warned",
  color = "#F89406",
  icon = shiny::icon("warning-sign", lib = "glyphicon"),
  textPosition = "relative",
  session = shiny::getDefaultReactiveDomain()
)

feedbackDanger(
  inputId,
  show,
  text = "Danger, turn back!",
  color = "#d9534f",
  icon = shiny::icon("exclamation-sign", lib = "glyphicon"),
  textPosition = "relative",
  session = shiny::getDefaultReactiveDomain()
)

feedbackSuccess(
  inputId,
  show,
  text = NULL,
  color = "#5cb85c",
  icon = shiny::icon("ok", lib = "glyphicon"),
  textPosition = "relative",
  session = shiny::getDefaultReactiveDomain()
)
}
\arguments{
\item{inputId}{the Shiny input's \code{inputId} argument}

\item{show}{Whether or not the feedback should be shown.  The `show` argument
uses `shiny::isTruthy()` to evaluate its value to `TRUE` or `FALSE`.}

\item{text}{text string to display below input}

\item{color}{the color of the feedback}

\item{icon}{an html icon tag}

\item{textPosition}{the CSS position for the div containing the feedback text.  The
default is "relative".  Set to "absolute" to keep the text from shifting other 
elements on the page.}

\item{session}{the \code{shiny} session}
}
\description{
Show / hide feedback messages.
}
\seealso{
showFeedback hideFeedback
}
