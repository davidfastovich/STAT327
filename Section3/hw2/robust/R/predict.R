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