# Draw connect four board.

x = rep(1:7, each = 6)
y = rep(1:6, times = 7)

plot(x, y, type="n", xlim=c(0, 8), ylim=c(7, 0))
segments(x0 = c(0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5), 
         y0 = c(6.5, 5.5, 4.5, 3.5, 2.5, 1.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5), 
         x1 = c(7.5, 7.5, 7.5, 7.5, 7.5, 7.5, 7.5, 0.5, 0.5, 1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5), 
         y1 = c(6.5, 5.5, 4.5, 3.5, 2.5, 1.5, 0.5, 6.5, 0.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5))

# Data matrix used to keep track of the game
board = matrix(data=rep("E", times=42), nrow=6, ncol=7)

# Game! With functions to check for win and largest empty row
player = "X"
for (i in 1:42) {
  index = identify(x, y, n=1)
  col = x[index]
  empty = largest.empty.row(board, col)
  # if (empty == TRUE) {
  #   cat(set = "", "Column is full, select an empty column.", "\n")
  #   index = identify(x, y, n=1)
  # }
  row = y[empty]
  board[row, col] = player
  text(x=col, y=row, labels=player)
  cat(sep="", "i=", i, ", player=", player, ", index=", index,
      ", row=", row, ", col=", col, ", board:", "\n")
  print(board)
  if(won(player, board, row, col)) {
    text(x=2, y=1/3, labels=paste(player, " won!"), col="red")
    break
  }
  player = ifelse(test=(player == "X"), yes="O", no="X")
}
