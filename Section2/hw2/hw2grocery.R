# Reading grocery prices
groceries <- read.table("groceries.csv", stringsAsFactors = FALSE, sep = ",")

# 4.1 How many helper function
how.many <- function(item, n.max){
  q <- cat(sep = "",  "How many ", item, "?")
  n <- as.numeric(readline(q))
  while(n > n.max) {
    cat(sep = "", "ERROR: too many for the budget", "\n")
    q <- cat(sep = "",  "How many ", item, "?")
    n <- as.numeric(readline(q))
  }
  return(n)
}

# 4.2 Grocery list function
grocery.list <- function(file, budget) {
  groceries <- read.table(file, stringsAsFactors = FALSE, sep = ",")
  names(groceries)[1] <- "item"
  names(groceries)[2] <- "price"
  print(groceries)
  total = 0
  shopping.list = data.frame(item = character(), price = character(), quantity = character(), stringsAsFactors = FALSE)
  for(i in seq_len(length(groceries$item))) {
    if(groceries$price[i] < (budget-total)) {
    n = how.many(groceries$item[i], n.max = floor((budget-total)/groceries$price[i]))
    total = total + (n * (groceries$price[i]))
    to.buy <- data.frame(a = groceries$item[i], b = groceries$price[i], c = n)
    shopping.list = rbind(shopping.list, to.buy)
    }
  }
  colnames(shopping.list) = c("item", "price", "quantity")
  return(shopping.list)
}

to.buy <- data.frame(groceries$item[i], groceries$price[i], n)
colnames(to.buy) <- c("")