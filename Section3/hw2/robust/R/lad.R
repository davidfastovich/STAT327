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
  new <- vector()
  class(new) <- "lad"
  sad.function <- function(x, y, b) {
    b0 <- b[1]
    b1 <- b[2]
    value <- y - b0 - (b1*x)
    return((sum(abs(value))))
  }
  par <- lm(y ~ x)
  optim(par = c(par$coefficients[1], par$coefficients[2]), fn = sad.function.loop, x = area$land, y = area$farm)
}

# Test lm
area <- read.csv("http://www.stat.wisc.edu/~jgillett/327-3/1/farmLandArea.csv")
x = area$land
y = area$farm
lm(farm ~ land, data = area)

sad.function.loop <- function(x, y, b) {
  b0 <- b[1]
  b1 <- b[2]
  value <- list()
  for (i in 50) {
    value[i] <- (y[i] - b0 - (b1*x[i]))
    }
  return(-(sum(abs(value))))
}

for i in  {
  value <- (y[i] - b0 - (b1*x[i]))
}
