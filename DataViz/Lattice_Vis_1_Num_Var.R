#Quantitative Univariate Analysis
# Visualizing One Numeric Variable

# Using the lattice graphics system
library("lattice")

# Set working directory
setwd("C:/Users/anyai/Documents/GitHub/DataViz")

# Load the movie data from csv
movies <- read.csv("Movies.csv")

# Peak at the structure
str(movies)

# Dot plot
stripplot(
  data = movies,
  x = ~Runtime,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)

# Jitter Plot
stripplot(
  data = movies,
  x = ~Runtime,
  jitter = TRUE,
  amount = 0.5,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)

# Box Plot
bwplot(  # bw stands for box and wiskers
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)

# Histogram
histogram(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)

# Density
densityplot(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)


# Make a 4 row 1 column dashboard
# Jitter Plot
jit <- stripplot(
  data = movies,
  x = ~Runtime,
  jitter = TRUE,
  amount = 0.5,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)

# Box Plot
bw <- bwplot(  # bw stands for box and wiskers
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)

# Histogram
hist <- histogram(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)

# Density
dens <- densityplot(
  x = ~Runtime,
  data = movies,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)

print(
  x = jit,
  position = c(0,0.75,1,1),
  more = TRUE
)

print(
  x = bw,
  position = c(0,0.50,1,0.75),
  more = TRUE
)

print(
  x = hist,
  position = c(0,0.25,1,0.50),
  more = TRUE
)

print(
  x = dens,
  position = c(0,0,1,0.25)
)

