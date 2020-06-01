install.packages("RSNNS")
glass<-read.csv("C:/Users/lenovo/Documents/DATA/glassClass.csv",header=TRUE)
glass$Type<-as.factor(glass$Type)

df = glass[sample(1:nrow(glass),length(1:nrow(glass))),1:ncol(glass)]
dfValues<-df[,1:9]
dfTarget<-decodeClassLabels( df[,10])

d= splitForTrainingAndTest(dfValues, dfTarget, ratio=0.20)
d<-normTrainingAndTestSet(d)

model = mlp(d$inputsTrain, 
            d$targetsTrain, 
            size=2, 
            learnFuncParams=c(0.1),
            maxit=10, 
            inputsTest=d$inputsTest, 
            targetsTest=d$targetsTest)
summary(model)
weightMatrix(model)
plotIterativeError(model)

result<-predict(model,d$inputsTest)

plotRegressionError(result[,2], d$targetsTest[,2])

confusionMatrix(d$targetsTrain,fitted.values(model))
##calculated the confusion matrix for the data used in the training
confusionMatrix(d$targetsTest,result)
##calculated the confusion matrix for the data used in the test
##(which is the remaining 20 percent of data