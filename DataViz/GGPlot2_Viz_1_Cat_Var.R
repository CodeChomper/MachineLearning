# Qualitative Univariate Analysis
# Analysis of a single categorical variable

# using movie data to answer questions with ggplot2:
library("ggplot2")

# Set working directory
setwd("C:/Users/anyai/Documents/GitHub/DataViz")

# Load the movie data from csv
movies <- read.csv("Movies.csv")

# Peak at the structure
str(movies)

# Create a frequency bar chart for ratings
ggplot(
  data = movies,
  aes(x = Rating)) +
  geom_bar() + 
  ggtitle("Count of Moves by Rating")

# Create a Horz frequency bar chart for ratings
ggplot(
  data = movies,
  aes(x = Rating)) +
  geom_bar() + 
  coord_flip() + # Key to fliping the chart on it's side
  ggtitle("Count of Movies by Rating")

# Create a Cleveland Dot Plot
ggplot(
  data = movies,
  aes(x = Rating)) +
  geom_point(stat = "count") + 
  coord_flip() + # Key to fliping the chart on it's side
  ggtitle("Count of Movies by Rating")

# Creating a pie in ggplot is kinda a hack. We use a geom_bar() but then set the polar cords to theta = "y"
ggplot(
  data = movies,
  aes(x = "", fill = Rating)) +
  geom_bar() +
  coord_polar(theta = "y") +
  ggtitle("Count of Movies by Rating") +
  ylab("")


ggplot(
  data = movies,
  aes(x = "", fill = Awards)) +
  geom_bar() +
  coord_polar(theta = "y") +
  ggtitle("Proportion of Movies that Won Awards") +
  ylab("")


















