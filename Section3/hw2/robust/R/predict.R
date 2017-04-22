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
predict.lad <- function(x) {
  value <- x$fitted.value
  names(value) <- 1:seq_len(x$fitted.values)
  return(value)
}

predicted.vals <- predict(test.fit)
