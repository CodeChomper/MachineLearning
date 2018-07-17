#Quantitative Univariate Analysis
# Visualizing One Numeric Variable

# Using the ggplot2 graphics system
library("ggplot2")

# Set working directory
setwd("C:/Users/anyai/Documents/GitHub/DataViz")

# Load the movie data from csv
movies <- read.csv("Movies.csv")

# Peak at the structure
str(movies)

# Dot Plot
ggplot(
  data = movies,
  aes(x = Runtime, stat = "count")) +
  geom_dotplot(binwidth = 1) +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (minutes)")

# Violin-style dot plot
ggplot(
  data = movies,
  aes(x = Runtime, stat = "count")) +
  geom_dotplot(binwidth = 1,
               stackdir = "center") +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (minutes)")

# Box plot
ggplot(
  data = movies,
  aes(x=Runtime, y=Runtime))+
  geom_boxplot() +
  coord_flip() +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("") +
  ylab("Runtime (minutes)")+
  theme(
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )

# Histogram
ggplot(
  data = movies,
  aes(x=Runtime)) +
  geom_histogram(binwidth = 5) +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (minutes)")

# Density Plot
ggplot(
  data = movies,
  aes(x=Runtime))+
  geom_density()+
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (minutes)")


# Create 4 row 1 column dash board

#clear Plot window
dev.off()

library(grid)

viewport <- viewport(
  layout = grid.layout(4,1))

pushViewport(viewport)

# Violin-style dot plot
dot <- ggplot(
  data = movies,
  aes(x = Runtime, stat = "count")) +
  geom_dotplot(binwidth = 1,
               stackdir = "center") +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (minutes)")

print(
  x = dot,
  vp = viewport(
    layout.pos.row = 1,
    layout.pos.col = 1
  )
)

# Box plot
box <- ggplot(
  data = movies,
  aes(x=Runtime, y=Runtime))+
  geom_boxplot() +
  coord_flip() +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("") +
  ylab("Runtime (minutes)")+
  theme(
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )

print(
  x = box,
  vp = viewport(
    layout.pos.row = 2,
    layout.pos.col = 1
  )
)

# Histogram
hist <- ggplot(
  data = movies,
  aes(x=Runtime)) +
  geom_histogram(binwidth = 5) +
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (minutes)")

print(
  x = hist,
  vp = viewport(
    layout.pos.row = 3,
    layout.pos.col = 1
  )
)

# Density Plot
dens <- ggplot(
  data = movies,
  aes(x=Runtime))+
  geom_density()+
  ggtitle("Distribution of Movie Runtimes") +
  xlab("Runtime (minutes)")

print(
  x = dens,
  vp = viewport(
    layout.pos.row = 4,
    layout.pos.col = 1
  )
)
