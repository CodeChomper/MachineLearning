# Qualitative Univariate Analysis
# Analysis of a single categorical variable

# using movie data to answer questions with lattice:
library("lattice")

# Set working directory
setwd("C:/Users/anyai/Documents/GitHub/DataViz")

# Load the movie data from csv
movies <- read.csv("Movies.csv")

# Peak at the structure
str(movies)

# Make Frequency Table
table <- table(movies$Rating)
print(table)

# Make a data frame from it
ratings <- as.data.frame(table)
print(ratings)

# Set the names of the columns
names(ratings) <- c("Rating", "Count")
print(ratings)

# Create the frequency bar chart
barchart(
  x = Count ~ Rating,
  data = ratings,
  main = "Count of Movies by Rating",
  xlab = "Rating"
)

# To make a horizontal bar chart flip the order of vars in x
barchart(
  x = Rating ~ Count,
  data = ratings,
  main = "Count of Movies by Rating",
  ylab = "Rating"
)

# To make a Cleveland Dot Plot do exaclty the same thing as horz bar but call dotplot()
dotplot(
  x = Rating ~ Count,
  data = ratings,
  main = "Count of Movies by Rating",
  ylab = "Rating"
)

# No Pie charts in Lattice but has a bar chart that displays the % of total on the Y-axis (Histogram)
histogram(
  x = ~Rating,
  data = movies,
  main = "Percent of Movies by Rating"
)

