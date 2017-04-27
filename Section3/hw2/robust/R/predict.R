#' Predict function for LAD class object
#'
#' Written to explicitely on objects from the least absolute deviations (LAD) regression fucntion.
#' @param object LAD class object
#' @param new.x Vector of new x values to generate a vector of new Y_hat values 
#' @param ... Additional arguments.
#' @return Y_hat A vector of predicted values using coefficients from LAD.
#' @det
#' @export
#' @examples
#' results <- lad(x = area$land, y = area$farm)
#' predict(results)
#' 
#' predict(results, new.x = 1:10)
#'
predict.lad <- function(object, new.x = FALSE, ...) {
  if (missing(new.x)) {
    value <- object$fitted.value
    names(value) <- 1:length(object$fitted.values)
    return(value)
    } else {
    predict.func <- function(new.x) {
      b <- object$coefficients
      y.hat <- b[1] + b[2]*as.numeric(new.x)
      names(y.hat) <- 1:length(new.x)
      return(y.hat)
      }
    new.y.hat <- predict.func(new.x)
      return(new.y.hat)
    }
}