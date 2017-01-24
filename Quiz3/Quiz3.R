#1
v <- c(24,17,11,20,27,26,16,6,22,1,12,14,18,1,23,3,0,0,29,23,21,26,17,29,2,17,2,10,19,0)
length(v)
even <- seq(from = 0, to = 30, by = 2)
sum(v[even])

#2
v.2 <- c(13,9,29,15,8,3,22,27,19,0,2,12,7,5,12)
sum(v[(v %in% v.2)])

#3
sort.v <- order(v)
sum(v[sort.v[1:3]])

#4
sum(sort.v[1:3])

#5
quint.v <- quantile(v, seq(0, 1, 1/5))
sum(quint.v)

#6
ham <- scan(file = "Hamlet.txt", what = character())
sum(ham == "memory")

#7
g <- list(fruit="apple", 
         dairy=c("milk", "eggs"), 
         lotto = c(4,2,1,7)
         )
g[[2]] <- c("milk", "eggs", "butter")

#8
g$snacks <- "popcorn"

#9
g$lotto[4] <- 6

#10
g$fruit <- NULL

#11
x = list(name = c("Alex","Betty","Chen","David","Eleanor"), 
         score = c(88,93,76,91,80)
         )
scores <- order(x$score, decreasing = TRUE)
x$name[scores]