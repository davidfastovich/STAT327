# Quiz 7

# 1
x <- c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28)
y <- c(7,7.5,5,6.5,8,8.5,6,4.5,4,4.5,6,6.5,7,11.5,13,11.5,8,9.5,15,12.5,13,16.5,14,14.5,12,15.5,19,15.5,19)
cor(x, y)

# 2
fit <- lm(y ~ x)
fit$coefficients

# 3
fit$coefficients

# 4, 5, 6
pred <- data.frame(x = c(13, 14, 15))
y.hat <- predict(fit, newdata = pred)
y.hat

# 7, 8
fit <- lm(qsec ~ disp + hp, data = mtcars)
fit$coefficients