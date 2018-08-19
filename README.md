# shinyFeedback

[![Travis-CI Build Status](https://travis-ci.org/merlinoa/shinyFeedback.svg?branch=master)](https://travis-ci.org/merlinoa/shinyFeedback) [![CRAN](http://www.r-pkg.org/badges/version/shinyFeedback)](https://cran.r-project.org/package=shinyFeedback) [![Downloads](http://cranlogs.r-pkg.org/badges/shinyFeedback)](http://www.r-pkg.org/pkg/shinyFeedback) ![CRAN downloads](http://cranlogs.r-pkg.org/badges/grand-total/shinyFeedback)

R package for displaying user feedback along side Shiny inputs

# Examples

### Shiny Input Feedbacks

- [Example App on GitHub](https://github.com/merlinoa/shinyFeedbackApp)

- Screenshot of shiny inputs with shinyFeedback messages displayed

![](inst/img/feedback-screenshot.png)

### Snackbar feedback

Show simple snackbar messages

![](inst/img/snackbar_gif.gif)

# Getting Started

### Install from CRAN

```R
install.packages("shinyFeedback")
```

### Or Install Dev Version from GitHub

```R
devtools::install_github("merlinoa/shinyFeedback", build_vignettes = TRUE)
```
### Read Intro Vignette

```R
# load package
library(shinyFeedback)
# read intro vignette
browseVignettes(package = "shinyFeedback")
```

### Roadmap

I would like to add support for more of the standard `shiny` input bindings and for several of the input bindings provided with the `shinyWidgets` package.

### Issues

If you use this package and have a problem please open a GitHub issue; I would be very interested to hear from you.  
