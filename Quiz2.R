setwd("~/Git/STAT572")

#q1
v <- c(8,26,28,15,14,10,4,6,13,5,15,8,25,5,6,21,28,0,15,7,11,15,0,5,0,25,15,4,22)
length(v)

#q2
sum(v < 10)

#q3
mean(v)

#q4
sd(v)

#q5
median(v)

#q6
min(v)

#q7
mean(c(v[1], v[29]))

#q12
sum(v[12:20])

#q13
sum(v[v < 12])

#q14
index <- which(c(v >= 12) & (v <= 20))
sum(v[index])

#q15
sum(index)

#q16
index.2 <- which(c(v < 12) | (v > 20))
sum(v[index.2])

#q17
