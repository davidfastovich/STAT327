# Quiz 8

# 1
set.seed(23)
a <- rnorm(3)
sum(a)

# 2
set.seed(7)
x <- replicate(n = 100,
               expr = {x = rnorm(4); sum((x - mean(x))^2)/4})
mean(x)

# 3
mean(x)*(4/3)
