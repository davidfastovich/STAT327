#' Predict function for LAD class object
#'
#' Written to explicitely on objects from the least absolute deviations (LAD) regression fucntion
#' @param x LAD class object
#' @param new.x Vector of new %x% values to generate a vector of new %Y_hat% values 
#' @return %Y_hat% A vector of predicted values using coefficients from LAD
#' @det
#' @export
#' @examples
#' results <- lad(x = area$land, y = area$farm)
#' predict(results)
#' 
#' predict(results, new.x = 1:10)
#'
predict.lad <- function(x,new.x = FALSE) {
  if (missing(new.x)) {
    value <- x$fitted.value
    names(value) <- 1:length(x$fitted.values)
    return(value)
    } else {
    predict.func <- function(new.x) {
      b <- x$coefficients
      y.hat <- b[1] + b[2]*new.x
      names(y.hat) <- 1:length(new.x)
      return(y.hat)
      }
    new.y.hat <- predict.func(new.x)
      return(new.y.hat)
    }
}