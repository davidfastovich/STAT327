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
  cat(sep = "", "Intercet", "\n",x$coefficient[1], "\n", "\n", "Slope", "\n", x$coefficient[2])
}
