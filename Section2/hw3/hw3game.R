# Draw connect four board.

rm(list=ls())

x = rep(1:3, each = 3)
y = rep(1:3, times = 3)

plot(x, y, type="n", xlim=c(0, 8), ylim=c(6, 0))
segments(x0 = c(0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5), 
         y0 = c(6, 5, 4, 3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
         x1 = c(7.5, 7.5, 7.5, 7.5, 7.5, 7.5, 7.5, 0.5, 0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5), 
         y1 = c(6, 5, 4, 3, 2, 1, 0, 6, 0, 6, 6, 6, 6, 6, 6, 6))


board = matrix(data=rep("E", times=42), nrow=6, ncol=7)

player = "X"
for (i in 1:42) {
  cat(sep="", "i=", i, ", player=", player, "\n")
  player = ifelse(test=(player == "X"), yes="O", no="X")
}

player = "X"
for (i in 1:42) {
  index = identify(x, y, n=1)
  col = x[index]
  row = y[index]
  board[row, col] = player
  text(x=col, y=row, labels=player)
  cat(sep="", "i=", i, ", player=", player, ", index=", index,
      ", row=", row, ", col=", col, ", board:", "\n")
  print(board)
  # ... player takes a turn ...
  player = ifelse(test=(player == "X"), yes="O", no="X")
}

plot(x, y, type="n", xlim=c(0, 8), ylim=c(6, 0))
segments(x0 = c(0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5), 
         y0 = c(6, 5, 4, 3, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
         x1 = c(7.5, 7.5, 7.5, 7.5, 7.5, 7.5, 7.5, 0.5, 0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5), 
         y1 = c(6, 5, 4, 3, 2, 1, 0, 6, 0, 6, 6, 6, 6, 6, 6, 6))
