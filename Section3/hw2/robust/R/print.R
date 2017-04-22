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
print.lad <- function(x) {
  cat(sep = "", "Intercet: ", x$coefficient[1], "\n", "Slope: ", x$coefficient[2])
}
