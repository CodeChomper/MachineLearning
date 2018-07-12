data_path <- "/home/json/Documents/git/MachineLearning/jan_2015_ontime.csv"

origData <- read.csv2(data_path, sep = ",", header = TRUE, stringsAsFactors = FALSE)

airports <- c('ATL','LAX','ORD','DFW','JFK','SFO','CLT','LAS','PHX')

origData <- subset(origData, DEST %in% airports & ORIGIN %in% airports)

# drop the X column
origData$X <- NULL

# Check for correlation the closer to 1 the more correlated the data is.
cor(origData[c("ORIGIN_AIRPORT_SEQ_ID", "ORIGIN_AIRPORT_ID")])

cor(origData[c("DEST_AIRPORT_ID","DEST_AIRPORT_SEQ_ID")])

# Drop the ORIGIN_AIRPORT_SEQ_ID and DEST_AIRPORT_SEQ_ID since they are correlated
origData$ORIGIN_AIRPORT_SEQ_ID <- NULL
origData$DEST_AIRPORT_SEQ_ID <- NULL

mismatched <- origData[origData$CARRIER != origData$UNIQUE_CARRIER,]

# Filter the data for rows that do not have 0 or 1 in delay columns
onTimeData <- origData[!is.na(origData$ARR_DEL15) & origData$ARR_DEL15 != "" & !is.na(origData$DEP_DEL15) & origData$DEP_DEL15 != "",]

# Convert string to int when ints are stored as strings
onTimeData$DISTANCE <- as.integer(onTimeData$DISTANCE)
onTimeData$CANCELLED <- as.integer(onTimeData$CANCELLED)
onTimeData$DIVERTED <- as.integer(onTimeData$DIVERTED)

# Change data to factors when the variation of data is low like all 0's and 1's all Yes and No's
onTimeData$ARR_DEL15 <- as.factor(onTimeData$ARR_DEL15)
onTimeData$DEP_DEL15 <- as.factor(onTimeData$DEP_DEL15)
onTimeData$DEST_AIRPORT_ID <- as.factor(onTimeData$DEST_AIRPORT_ID)
onTimeData$ORIGIN_AIRPORT_ID <- as.factor(onTimeData$ORIGIN_AIRPORT_ID)
onTimeData$DAY_OF_WEEK <- as.factor(onTimeData$DAY_OF_WEEK)
onTimeData$DEST <- as.factor(onTimeData$DEST)
onTimeData$ORIGIN <- as.factor(onTimeData$ORIGIN)
onTimeData$DEP_TIME_BLK <- as.factor(onTimeData$DEP_TIME_BLK)
onTimeData$CARRIER <- as.factor(onTimeData$CARRIER)

# Now we need to test the distribution of our data. Rare events are harder to predict.
tapply(onTimeData$ARR_DEL15, onTimeData$ARR_DEL15, length)
#25664 ontime and 6460 delayed

# Check the % of delayed Flights
(6460 / nrow(onTimeData))
#[1] 0.2010958 about 20% delayed Flights

# Load the Caret package
library(caret)

# Set the seed for random gen
set.seed(122515)

# get the columns we need
featureCols <-c("ARR_DEL15", "DAY_OF_WEEK", "CARRIER", "DEST", "ORIGIN", "DEP_TIME_BLK")
ontimeDataFiltered <- onTimeData[,featureCols]

# split the data into training and test
inTrainRows <- createDataPartition(ontimeDataFiltered$ARR_DEL15, p=0.70, list = FALSE)
trainDataFiltered <- ontimeDataFiltered[inTrainRows,]
testDataFiltered <- ontimeDataFiltered[-inTrainRows,]

# train the model
# The first parameter is the value we are trying to predict and the columns used to predict it
# sep the value to predict from the values used in prediction with a ~ since we already cleaned
# the data we can use  a . for the columns to use.
# the method="glm" is generalized linear regression. A list of methods is in the doc for caret
# to make sure we use logistics regression we need to set the family to binomial
logisticRegModel <- train(ARR_DEL15 ~ ., data = trainDataFiltered, method="glm", family="binomial")

# test the model
logRegPrediction <- predict(logisticRegModel, testDataFiltered)

# evaluate the quality of the model by using caret's confusionMatrix function
# the first param is the test we just ran and the second param is the test data's column we want to predict
logRegConfMat <- confusionMatrix(logRegPrediction, testDataFiltered[,"ARR_DEL15"])

print(logRegConfMat)

#The first set of statistics is a matrix that compares the predictive and actual values for delays
#               reference
# prediction   0.00  1.00
#       0.00     A    B
#       1.00     C    D

# A is the number of flights in the test data that were not delayed when the model predicted they would not be delayed.
# B is the number of flights in the test data were delayed when the model predicted they would not be delayed.
# C is the number of flights in the test data that were not delayed when the model predicted they would be delayed.
# D is the number of flights in the test data that were delayed when the model predicted they would be delayed.

# Accuracy is a ratio of the model prediction to the correct answer.
# Sensitivity is the measure of how the model predicts no delay when there is no delay.
# Specificity is the measure of how the model predicts delay when there is a delay.
# Pos Pred Value is the measure of how the model predicts when there will be no delay
# Neg Pred Value is the measure of how the model predicts when there will be a delay

# We need to improve our model, we have to many flights that are being delayed that are not being predected as delayed.
# We are going to try a different Algo

# Dump some stuff make RAM
logisticRegModel <- NULL
logRegConfMat <- NULL
mismatched <- NULL
onTimeData <- NULL
ontimeDataFiltered <- NULL
origData <- NULL


library(randomForest)
# The first param is the data minus the first col which is ARR_DEL15
# The second param is the column we want to predict
rfModel <- randomForest(trainDataFiltered[-1], trainDataFiltered$ARR_DEL15, proximity = TRUE, importance = TRUE)


