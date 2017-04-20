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
    return(sum(abs(y - b0 - (b1*x))))
  }
  par <- lm(y ~ x)
  result <- optim(par = c(par$coefficients[1], par$coefficients[2]), fn = sad.function, x = area$land, y = area$farm)
}

# Test lm
lm(farm ~ land, data = area)
area <- read.csv("http://www.stat.wisc.edu/~jgillett/327-3/1/farmLandArea.csv")
x = as.numeric(area$land)
y = as.numeric(area$farm)
b <- c(1,2)
plot(x = x, y = y)
abline(a = par$coefficients[1], b = par$coefficients[2])
abline(a = result$par[1], b = result$par[2], col = "green")
