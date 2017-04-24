#' Print LAD object coefficients
#'
#' This is a general function to print the regression coefficients from the \code{lad} function.
#' @param x An object from the \code{lad} function.
#' @return Regression coefficients to the console.
#' @export
#' @examples
#' results <- lad(x = area$land, y = area$farm)
#' print(results)
#'
print.lad <- function(x) {
  cat(sep = "", "Intercet", "\n",x$coefficient[1], "\n", "\n", "Slope", "\n", x$coefficient[2])
}
