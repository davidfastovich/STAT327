#' Least absolute deviations (LAD) regression
#'
#' This function performs and optimization using the Nelder-Mead method to find the regression coefficients of two objects. This method minimizes the sum of absolution deviations of data X from predictions of Y.
#' @param x The predictor variable of a data frame used for regression.
#'        y The response variable of a data fro mused for regression.
#' @return Returns a list containing regression coefficients, fitted values, and residuals.
#' @export
#' @examples
#' results <- lad(x = area$land, y = area$farm)
#' print(results)
#' 
#' plot(x = area$land, y = area$farm)
#' abline(lm(area$farm ~ area$land), col = "coral")
#' abline(results, col = "blue")
#' 
#' quant.land <- c(quantile(area$land, 0), quantile(area$land, .25), quantile(area$land, .5), quantile(area$land, .75), quantile(area$land, 1))
#' new.y <- predict(results, new.x = quant.land)
#' points(x = quant.land, y = new.y, col = "green", pch = 16)
#'
#' legend("bottomright", legend = c("lm", "LAD", "Predicted Quantiles"), lty = c(1, 1, NA), pch = c(NA, NA, 16), col = c("coral", "blue", "green"))
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
    return(y. <- b[1] + b[2]*x)
  }
  
  par <- lm(y ~ x)
  value <- optim(par = c(par$coefficients[1], par$coefficients[2]), fn = sad.function, x = area$land, y = area$farm)
  results$coefficients <- c(value$par[1], value$par[2])
  results$coefficients <- coef(results)
  results$fitted.values <- predict.func(x, y, c(results$coefficients[1], results$coefficients[2]))
  results$residuals <- y - results$fitted.value
  return(results)
}
