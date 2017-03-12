# Name: David Fastovich
# Email: fastovich@wisc.edu

rm(list = ls())

# Implement Connect Four in the same manner that we
# implemented Tic-tac-toe in class. Start by implementing
# the helper functions, below, and testing them by running
#   source("hw3test.R")
# Then write code for the game itself.
#
# We'll test your code by running
#   source("hw3.R")
# We might also play Connect Four, read your code, and do other tests.

# Returns TRUE if vector v (of character strings) contains
# (at least) four in a row of player (character string). e.g.
#   four.in.a.row("X", c("O","X","X","X","X","O"))
# is TRUE, while
#   four.in.a.row("O", c("O","X","X","X","X","O"))
# is FALSE.
four.in.a.row = function(player, v, debug=FALSE) {
  if (debug) {
    cat(sep="", "four.in.a.row(player=", player, ", v=", v, ")\n")
  } 
  if(sum(player == v) >= 4) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

# Returns TRUE if (matrix) board (of character strings)
# contains at least four in a row of (string) player, who
# just played in position (r, c). (Here "r" means "row" and
# "c" means "column").
#
# Hint: this function should call four.in.a.row() four times, once
# each for the current row, column, diagonal, and reverse diagonal.
won = function(player, board, r, c, debug=FALSE) {
  if (debug) {
    cat(sep="", "won(player=", player, ", board=\n")
    print(board)
    cat(sep="", ", r=", r, ", c=", c, ")\n")
  }
  if(four.in.a.row(player, v = board[row(board) == r]) == TRUE) {
    return(TRUE)
  } else if (four.in.a.row(player, v = board[col(board) == c]) == TRUE) {
    return(TRUE)
  } else if (four.in.a.row(player, v = board[row(board) - col(board) == r - c]) == TRUE) {
    return(TRUE)
  } else if (four.in.a.row(player, v = board[row(board) + col(board) == r + c]) == TRUE) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

# Returns largest index of an empty position in column col
# of (matrix) board. If there is no such empty position in
# board, return value is NULL.
largest.empty.row = function(board, col, debug=FALSE) {
  if (debug) {
    cat(sep="", "largest.empty.row(board=\n")
    print(board)
    cat(sep="", ", col=", col, ")\n")
  }
  if (any(board[,col] == "E")) {
    return(max(which(board[,col] == "E")))
  } else {
   return(TRUE) 
  }
}
source("hw3test.R") # Run tests on the functions above.

# ... your code to implement Connect Four using the
# functions above ...


# Hint: this program is modeled on the tic-tac-toe program we did in
# class, so studying the latter program is worthwhile.

# Note that a user click in a column indicates that a checker should
# go to that column's lowest empty row (unless the column is full).

# Note that you should implement a computer player. At the least, it
# should choose randomly from among the non-full columns. (Feel free
# to do much more! If your computer player beats me on its first try,
# you will earn a package of M&Ms. This is a hard task. Feel free to
# ask for tips.)