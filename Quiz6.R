#Quiz 6

#q1
x <- c(12, 8.2, 9.7, 8.3, 8.1, 9.8, 7.8, 10.3, 11.3, 12.3, 10.6, 10.5, 6.5, 9.1, 10.6, 6.2, 9.6, 8.8, 12.9, 11.2)
out <- t.test(x, alternative = "greater", mu = 8.8, conf.level = 0.90)
out$statistic

#q2
out$p.value

#q3
out <- t.test(x, alternative = "two.sided", mu = 8.8, conf.level = 0.90)
out$conf.int

#q4
out$conf.int

##q5
x <- c(10.8, 12.4, 7.7, 11.6, 8.5, 4.7, 5.7)
y <- c(6.1, 9.1, 6.4, 13, 7.9, 6.7, 1.1, 5)
out <- var.test(x, y, alternative = "two.sided")
out$statistic

#q6
out$p.value

#q7
x <- matrix(data = c(18, 13, 15, 15, 14, 15, 18, 12, 15), nrow = 3, ncol = 3)
out <- chisq.test(x)
out$statistic

#q8
out$p.value

#q9
out <- prop.test(35, 55, 0.5, alternative = "two.sided", correct = FALSE)
out$statistic

#q10
out$p.value
