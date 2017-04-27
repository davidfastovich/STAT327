# Laptop
setwd("~/Git/STAT327/Section3/hw2")

# Desktop
setwd("~/GitHub/STAT327/Section3/hw2")

# Loading libraries needed to create package
library(roxygen2)
library(devtools)

# Creating robust package
# create("robust")

# Testing function
check(pkg="robust")

# Building package
build(pkg="robust")

# Installing package
install.packages(pkgs="robust_0.0.0.9000.tar.gz", repos = NULL, type = "source")

# Remove package
remove.packages("robust")

# Testing function
area <- read.csv("http://www.stat.wisc.edu/~jgillett/327-3/2/farmLandArea.csv")
x <- area$land
y <- area$farm
test.fit <- lm(y ~ x)

results<- lad(x, y)
predict(results)
predict(results, new.x = 1:10)
print(results)
coef(results)
plot(x = x, y = y)
abline(results)

# Testing LAD example
rm(list = ls())
results <- lad(x = area$land, y = area$farm)
print(results)

plot(x = area$land, y = area$farm)
abline(lm(area$farm ~ area$land), col = "coral")
abline(results, col = "blue")

quant.area <- c(quantile(area$land, 0), quantile(area$land, .25), quantile(area$land, .5), quantile(area$land, .75), quantile(area$land, 1))
new.y <- predict(results, new.x = quant.area)
points(x = quant.area, y = new.y, col = "green", pch = 16)

legend("bottomright", legend = c("lm", "LAD", "Predicted Quantiles"), lty = c(1, 1, NA), pch = c(NA, NA, 16), col = c("coral", "blue", "green"))

# Tests performed by profs
install.packages(pkgs="robust_0.1.tar.gz", repos=NULL, type="source")
require("robust")
example(lad)
?lad
?area
?print.lad
?coef.lad
?predict.lad

print(lad(x=area$land, y=area$farm))

# Additional tests
require(robust)
plot(x = mtcars$mpg, y = mtcars$hp)
abline(lm(mtcars$hp ~ mtcars$mpg))
abline(lad(x = mtcars$mpg, y = mtcars$hp), col = "green")

plot(x = iris$Petal.Length, y = iris$Sepal.Length)
abline(lm(iris$Sepal.Length ~ iris$Petal.Length))
abline(lad(x = iris$Petal.Length, y = iris$Sepal.Length), col = "green")

require(graphics)

## Annette Dobson (1990) "An Introduction to Generalized Linear Models".
## Page 9: Plant Weight Data.
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)
lm(weight ~ group)
lad(x = group, y = weight)

## Setup up coordinate system (with x == y aspect ratio):
plot(c(-2,3), c(-1,5), type = "n", xlab = "x", ylab = "y", asp = 1)
## the x- and y-axis, and an integer grid
abline(h = 0, v = 0, col = "gray60")
text(1,0, "abline( h = 0 )", col = "gray60", adj = c(0, -.1))
abline(h = -1:5, v = -2:3, col = "lightgray", lty = 3)
abline(a = 1, b = 2, col = 2)
text(1,3, "abline( 1, 2 )", col = 2, adj = c(-.1, -.1))

## Simple Regression Lines:
require(stats)
sale5 <- c(6, 4, 9, 7, 6, 12, 8, 10, 9, 13)
plot(sale5)
abline(lsfit(1:10, sale5))
abline(lsfit(1:10, sale5, intercept = FALSE), col = 4) # less fitting
abline(lad(x = 1:10, y = sale5))

z <- lm(dist ~ speed, data = cars)
plot(cars)
abline(z) # equivalent to abline(reg = z) or
abline(lad(x = cars$speed, y = cars$dist))
abline(coef = coef(z))
