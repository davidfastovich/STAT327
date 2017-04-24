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
