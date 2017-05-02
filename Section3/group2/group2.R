rm(list = ls())

# Required packages for script to work
library(rgl)

# Making function to minimize
egg <- function(x, y) {
  # x = par[1]
  # y = par[2]
  return((1 - (x / k))*(1 + (x / k))*(1 - (y / k))*(1 + (y / k))*(-(y + 47) * sin(sqrt(abs(y + (x/2) + 47))) - (x*sin(sqrt(abs(x - (y + 47)))))))
}

# This form takes (x, y) and k as three parameters.
e = function(x, y, k) {
  k = 120
  ifelse (test=((abs(x) > k) | (abs(y) > k)),
          yes=0,
          no=(1 - x/k)*(1 - y/k)*(1 + x/k)*(1 + y/k)*
            (-(y + 47) * sin(sqrt(abs(y + x/2 + 47))) - x*sin(sqrt(abs(x - (y + 47)))))
  )
}

# This form takes (x, y) as the 2-vector x and k as a second parameter.
f = function(x, k) {
  ifelse (test=((abs(x[1]) > k) | (abs(x[2]) > k)),
          yes=0,
          no=(1 - x[1]/k)*(1 - x[2]/k)*(1 + x[1]/k)*(1 + x[2]/k)*
            (-(x[2] + 47) * sin(sqrt(abs(x[2] + x[1]/2 + 47))) - x[1]*sin(sqrt(abs(x[1] - (x[2] + 47)))))
  )
}
# Plotting function
k <- 120
grid.n <- k
grid.x <- seq(-k, k, length.out = grid.n)
grid.y <- grid.x
z <- outer(grid.x, grid.y, e)
persp3d(x = grid.x, y = grid.y, z = z, col = "light blue") 

# Finding a local maximum
max1 <- optim(par = c(0,0), fn = f, k = 120, method = "Nelder-Mead", control=list(fnscale=-1))
max2 <- optim(par = c(-100, -100), fn = f, k = 120, method = "Nelder-Mead", control=list(fnscale=-1))
persp3d(x = grid.x, y = grid.y, z = z, col = "light blue") 
points3d(x = max1$par[1], y = max1$par[2], z = max1$value, col = "red")
points3d(x = max2$par[1], y = max2$par[2], z = max2$value, col = "red")

# Loop to test all possible parameter combinations based on the grid I made eariler and then bind it to one data frame
all.max <- data.frame(x = numeric(), y = numeric(), z = numeric())
for (i in 1:120) {
  max1 <- optim(par = c(i, i), fn = f, k = 120, method = "Nelder-Mead", control=list(fnscale=-1))
  max2 <- optim(par = c(i, -i), fn = f, k = 120, method = "Nelder-Mead", control=list(fnscale=-1))
  max3 <- optim(par = c(-i, i), fn = f, k = 120, method = "Nelder-Mead", control=list(fnscale=-1))
  max4 <- optim(par = c(-i, -i), fn = f, k = 120, method = "Nelder-Mead", control=list(fnscale=-1))
  max1.data <- data.frame(x = max1$par[1], y = max1$par[2], z = max1$value)
  max2.data <- data.frame(x = max2$par[1], y = max2$par[2], z = max2$value)
  max3.data <- data.frame(x = max3$par[1], y = max3$par[2], z = max3$value)
  max4.data <- data.frame(x = max4$par[1], y = max4$par[2], z = max4$value)
  all.max <- rbind(all.max, max1.data)
  all.max <- rbind(all.max, max2.data)
  all.max <- rbind(all.max, max3.data)
  all.max <- rbind(all.max, max4.data)
}

# Plotting all results
persp3d(x = grid.x, y = grid.y, z = z, col = "light blue")
points3d(x = all.max$x, y = all.max$y, z = all.max$z, col = "red")

# Max value
order(all.max$z, decreasing = TRUE)
points3d(x = all.max[395, ][[1]], y = all.max[395, ][[2]], z = all.max[395, ][[3]], col = "green")

# 