#' Add least absolute deviations regression line
#'
#' This is a function allows ceofficients from the \code{lad} function to be plotted onto an existing plot.
#' @param x LAD class object
#' @return \beta_0 and \beta_1 of LAD regression
#' @details Typical usage is \code{abline(results)}
#' @export
#' @examples
#' results <- lad(x = area$land, y = area$farm)
#' plot(x = area$land, y = area$farm)
#' abline(results)
#' 
#' coef(results)
#'
coef.lad <- function(x) {
  a <- x$coefficient[1]
  b <- x$coefficient[2]
  return(c(a, b))
}
