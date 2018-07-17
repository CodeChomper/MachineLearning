# Qualitative Univariate Analysis
# Analysis of a single categorical variable

# using movie data to answer questions with base charts:

# Set working directory
setwd("C:/Users/anyai/Documents/GitHub/DataViz")

# Load the movie data from csv
movies <- read.csv("Movies.csv")

# Peak at the structure
str(movies)

# How do the number of movies in each rating category compare to each other
# Create a frequency bar chart of ratings with base ploting
plot(
  x = movies$Rating,
  main = "Count of Movies by Rating",
  xlab = "Rating",
  ylab = "Count of Movies"
)

# Horizontal bar chart
plot(
  x = movies$Rating,
  horiz = TRUE,
  main = "Count of Movies by Rating",
  xlab = "Count of Movies",
  ylab = "Rating"
)

# Create a Cleveland dot plot
dotchart(
  x = table(movies$Rating), # table() function creates a frequency table from a single var
  pch = 16, # Makes the dot a solid black circle easier to see
  main = "Count of Movies by Rating",
  xlab = "Count of movies",
  ylab = "Rating"
)

# Create a pie chart to compair them all against eachother
pie(
  x = table(movies$Rating),
  main = "Moves by Rating"
)

# Create a pie chart to compair moves with awards and movies without (Much better use case for pie chart)
pie(
  x = table(movies$Awards),
  clockwise = TRUE,
  main = "Moves by Award Status"
)
