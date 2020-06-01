install.packages("nnet")
data(iris)
summary(iris)

fit <- nnet(Species~., data=iris, size=4, decay=0.0001, maxit=500)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, iris[,1:4], type="class")
table(predictions)
# summarize accuracy
library(caret)
table(row=predictions,col=iris$Species)
confusionMatrix(predictions, iris$Species)

