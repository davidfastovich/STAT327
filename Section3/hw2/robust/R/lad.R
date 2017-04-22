#' (title at top of help page)
#'
#' (Description paragraph)
#' @param x (description of x; one line per parameter: Arguments section)
#' @return (Value section)
#' @details (Details section)
#' @export
#' @examples
#' # (Examples section)
#' f(x)
#'
lad <- function(x, y) {
  results <- list()
  class(results) <- "lad"
  
  sad.function <- function(x, y, b) {
    b0 <- b[1]
    b1 <- b[2]
    return(sum(abs(y - b0 - (b1*x))))
  }
  
  predict.func <- function(x, y, b) {
    return(y.hat <- b[1] + b[2]*x)
  }
  
  par <- lm(y ~ x)
  value <- optim(par = c(par$coefficients[1], par$coefficients[2]), fn = sad.function, x = area$land, y = area$farm)
  results$coefficients <- c(value$par[1], value$par[2])
  results$coefficients <- coef(results)
  results$fitted.values <- predict.func(x, y, c(results$coefficients[1], results$coefficients[2]))
  results$residuals <- y - results$fitted.value
  return(results)
}
