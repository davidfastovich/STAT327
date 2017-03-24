setwd("~/STAT327/Section2/Quiz1")
v = readLines(con="fastovichQ1.txt")

# 1
length(grep(pattern = "^A|B|C", x = v))

# 2
length(grep(pattern = "\\D[^aeiou]\\> ", x = v))

# 3
length(grep(pattern = "([0-9])\\1", x = v))

# 4
v.words <- sub(pattern = "(\\S+\\s\\S+\\s)", replacement = "\\3", x = v)
length(grep(pattern = "([aeiou][aeiou])+", x = v.words))

# 5
v.csv <- sub(pattern = "(\\w+) +(\\d+) (\\w+).*", replacement = "\\1,\\2,\\3", x = v)
x = read.csv(file = textConnection(v.csv), header = FALSE)
sum(as.numeric(unlist(strsplit(x = as.character(x$SCORE), split = "*"))))
colnames(x) = c("NAME", "SCORE", "WORD")
sum(x$SCORE)

# 6
v.words.flip <- sub(pattern = "([aeiou])([^aeiou])", replacement = "\\2\\1", x = v.words)
length(grep(pattern = "([aeiou][aeiou])+", x = v.words.flip))