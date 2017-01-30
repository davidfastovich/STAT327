#Quiz 3

setwd("~/GitHub/STAT327/Quiz4")

#1
str(mtcars) #11 variables means 11 columns

#2
m <- mtcars
table(m$gear, m$cyl)

#3
test <- read.csv("fastovichQ4.csv")
mean(test$age[test$sex == "F"])

#4
mean(test$age[test$sex == "M" & test$eye.color == "brown"])

#5
sum(test$hair.color == "black" | test$hair.color == "blond" | test$hair.color == "brown")

#6
sum(test$eye.color == "hazel" & !test$hair.color == "gray")

#7
sorted <- test[order(test$weight, decreasing = TRUE),]
sorted[3,]

#8
test$neg.weight <- test$weight*(-1)
sorted <- test[order(test$eye.color, test$neg.weight, decreasing = TRUE), ]

#9
summary(CO2)

#10
mean(CO2$uptake[CO2$Type == "Quebec"])

#11
sd(CO2$uptake[CO2$Type == "Quebec"])

#12
mean(CO2$uptake[CO2$Type == "Mississippi"])

#13
sd(CO2$uptake[CO2$Type == "Mississippi"])
