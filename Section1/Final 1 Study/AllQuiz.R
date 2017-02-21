# Quiz 1 ------------------------------------------------------------------

# 1
(1001)^(1/3)

# 2
(1001/19)

# 3
1001 %/% 19

# 4
1001 %% 19

# 5
log(1001, base = 19)

# 6
round(10.853)

# 7
floor(10.613)

# 8
pnorm(11.9, mean = 12, sd = 7, lower.tail = TRUE)

# 9
qnorm(.2, mean = 12, sd = 7, lower.tail = TRUE)

# 10
pt(-0.2, df = 15, lower.tail = FALSE)

# 11
qt((.03/2), df = 15, lower.tail = FALSE)

# 12
dbinom(x = 12,25, p = 0.45)

# 13
pbinom(12, size = 25, p = .45, lower.tail = TRUE)


# Quiz 2 ------------------------------------------------------------------

# 1
x <- c(21,16,10,11,25,5,6,0,12,17,21,28,30,26,28,11,0,13,4,25,1,20,6,13,2,11,3,9,6,11,15,9)
length(x)

# 2
length(which(x < 13))

# 3
mean(x)

# 4
sd(x)

# 5
median(x)

# 6
min(x)

# 7
mean(c(x[1], x[32]))

# 12
sum(x[11:21])

# 13
sum(x[x < 11])

# 14
sum(x[x >= 11 & x <= 21])

# 15
sum(which(x >= 11 & x <= 21))

# 16
sum(x[x < 11 | x > 21])

# 17
sum(x[x %% 2 == 0])

# 18
s <- seq(0, 32, by = 5)
sum(x[s])

# Quiz 3 ------------------------------------------------------------------

# 1
x <- c(23,28,27,7,2,13,6,4,28,19,11,15,26,10,28,8,6,21,5,23,16,29,15,15,20,8,14,15,2,22)
length(x)
s <- seq(0, 30, by = 2)
sum(x[s])

# 2
v <- c(3,18,13,7,1,17,4,12,13,27,21,29,11,10,11)
sum(x[x %in% v])

# 3
s <- sort(x)
sum(s[1:3])

# 4
sum(order(x)[1:3])

# 5
sum(quantile(x,seq(0, 1, by = (1/5)))[2:5])

# 6
hamlet <- scan("Hamlet.txt", character())
sum(hamlet == "memory")

# 7
g = list(fruit="apple", dairy=c("milk", "eggs"), lotto = c(4,2,1,7))
g$dairy <- c("milk", "eggs", "butter") 

# 8
g$snacks <- "popcorn"

# 9
g$lotto[4] <- 6

# 10
g$fruit <-  NULL

# 11
x = list(name=c("Alex","Betty","Chen","David","Eleanor"), score=c(88,93,76,91,80))
s <- order(x$score, decreasing = TRUE)
x$name[s]

# Quiz 4 ------------------------------------------------------------------

# 1
str(mtcars)

# 2
table(mtcars$gear, mtcars$cyl)

# 3
x <- read.csv("fastovichQ4.csv")
mean(x$age[x$sex == "F"])

# 4
mean(x$age[x$sex == "M" & x$eye.color == "brown"])

# 5
length(x$hair.color[x$hair.color == "black" | x$hair.color == "blond" | x$hair.color == "brown"])

# 6
length(x$eye.color[x$eye.color == "hazel" & x$hair.color != "gray"])

# 7
w <- order(x$weight, decreasing = TRUE)
x$age[w]

# 8
x[order(x$eye.color, (-1*x$weight), decreasing = TRUE), ]

# 9
summary(CO2)

# 10
mean(CO2$uptake[CO2$Type == "Quebec"])

# 11
sd(CO2$uptake[CO2$Type == "Quebec"])

# 12
mean(CO2$uptake[CO2$Type == "Mississippi"])

# 13
sd(CO2$uptake[CO2$Type == "Mississippi"])

# 14
par(mfrow = c(1,2))
boxplot(CO2$uptake)
boxplot(CO2$uptake~CO2$Type)

# Quiz 5 ------------------------------------------------------------------

# 2
boxplot(mtcars$mpg~mtcars$gear)

# 3
boxplot(iris$Petal.Length~iris$Species)

# 4
hist(iris$Petal.Length, 0:7)

# 5
plot(density(iris$Petal.Length))

# 6
pairs(iris)

# 8
barplot(table(chickwts$feed))

# Quiz 6 ------------------------------------------------------------------

# 1
x <- c(4.4, 8.5, 9.9, 6.2, 16.4, 4, 3.4, 4.8, 8.2, 7.5, 8.7, -5, 8.4, 9.1, 9.1, 6.8, 12.7, 5.3, 2.8, 6.6, 15.2, 5.3)
t <- t.test(x, mu = 5.8, alternative = "greater", conf.level = .9)

# 2
t$p.value

# 3, 4
t <- t.test(x, mu = 5.8, alternative = "two.sided", conf.level = .9)
t$conf.int

# 5
x <- c(8.8, 11.5, 10.7, 13.1, 13.3, 9.3)
y <- c(1.8, 4.8, 3.4, 7.4, 0.8, 7, 4.4, 7)
out <- var.test(x, y)
out$statistic

# 6
out$p.value

# 7
chi <- matrix(data = c(16, 15, 13, 19, 18, 11, 15, 17, 11), ncol = 3, nrow = 3)
out <- chisq.test(chi)
out$statistic

# 8
out$p.value

# 9
out <- prop.test(34, 56, p = 0.5, alternative = "two.sided", correct = FALSE)
out$statistic

# 10
out$p.value

# Quiz 7 ------------------------------------------------------------------

# 1
x <- c(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27)
y <- c(1,6.5,6,4.5,5,6.5,6,4.5,10,8.5,7,7.5,8,6.5,12,10.5,11,14.5,13,9.5,16,11.5,14,17.5,18,16.5,19,16.5)
cor(x,y)

# 2, 3
fit <- lm(y ~ x)
fit$coefficients

# 4, 5, 6
predict(fit, newdata = data.frame(x = c(12.5, 13.5, 14.5)))

# 7
fit.mult <- lm(qsec ~ disp + hp, data = mtcars)
fit.mult$coefficients

# Quiz 8 ------------------------------------------------------------------

# 1
set.seed(23)
sum(rnorm(3))

# 2
set.seed(7)
var.sim <- replicate(n = 100, expr = {x = rnorm(4); mean(sum((x-mean(x))^2))/4})
mean(var.sim)

# 3
mean(var.sim)*(4/3)