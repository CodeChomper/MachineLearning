#Quantitative Univariate Analysis
# Visualizing One Numeric Variable

# Using the base graphics system

# Set working directory
setwd("C:/Users/anyai/Documents/GitHub/DataViz")

# Load the movie data from csv
movies <- read.csv("Movies.csv")

# Peak at the structure
str(movies)

# Create a Dot plot to show movie runtimes
plot(
  x = movies$Runtime,
  y = rep(0, nrow(movies)), #rep makes a vector of value param1 and of length param2
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)",
  ylab = "",
  yaxt = "n",
  pch = 16,
  col = rgb(0,0,0,0.1)
)

# Create a jitter plot to show movie runtimes
plot(
  x = movies$Runtime,
  y = jitter(rep(0, nrow(movies))), #rep makes a vector of value param1 and of length param2
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)",
  ylab = "",
  yaxt = "n",
  pch = 16,
  col = rgb(0,0,0,0.5)
)


# Box plot shows the five number summary statistics for a single quantitative variable
# Minimum value excluding outliers
# The lower, or first quartile, the  median, the upper, or third quartile
# Max value excluding outliers
# Outliers = Q1 - (1.5 * IQR) or Q3 + (1.5 * IQR)
boxplot(
  x = movies$Runtime,
  horizontal = TRUE,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)


# Histogram of runtime
hist(
  x = movies$Runtime,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)",
  breaks = 30
)

# Density plot
plot(
  x = density(movies$Runtime),
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)

# Make a 4 row 1 column dashboard
par(mfrow = c(4,1))

# Draw all four charts again
# Create a jitter plot to show movie runtimes
plot(
  x = movies$Runtime,
  y = jitter(rep(0, nrow(movies))), #rep makes a vector of value param1 and of length param2
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)",
  ylab = "",
  yaxt = "n",
  pch = 16,
  col = rgb(0,0,0,0.5)
)


# Box plot shows the five number summary statistics for a single quantitative variable
boxplot(
  x = movies$Runtime,
  horizontal = TRUE,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)


# Histogram of runtime
hist(
  x = movies$Runtime,
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)",
  breaks = 30
)

# Density plot
plot(
  x = density(movies$Runtime),
  main = "Distribution of Movie Runtimes",
  xlab = "Runtime (minutes)"
)

# Set rows back to 1
par(mfrow = c(1,1))


