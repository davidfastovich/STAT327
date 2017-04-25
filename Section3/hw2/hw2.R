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

