setwd("~/Git/STAT327/Section3/hw2")

# Loading libraries needed to create package
library(roxygen2)
library(devtools)

# Creating robust package
create("robust")

# Testing function
area <- read.csv("http://www.stat.wisc.edu/~jgillett/327-3/2/farmLandArea.csv")
x <- area$land
y <- area$farm
test.fit <- lm(y ~ x)

results <- lad(x, y)
print(results)
coef(results)
plot(x = x, y = y)
abline(results)
