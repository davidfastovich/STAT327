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
coef.lad <- function(x) {
  a <- x$coefficient[1]
  b <- x$coefficient[2]
  return(c(a, b))
}