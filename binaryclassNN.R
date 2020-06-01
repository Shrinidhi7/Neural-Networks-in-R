credit=read.csv("C:/Users/lenovo/Documents/DATA/Credit_Card.csv",header=TRUE)
credit<-credit[,-1]
names(credit)[names(credit) == 'default.payment.next.month'] <- 'default'
df<-credit
df$default[df$default==1] <- 'Yes'
df$default[df$default==0] <- 'No'

set.seed(99)
Train = createDataPartition(df$default, p=0.75, list=FALSE)
#split data in 75%-25% ratio

training = df[ Train, ] #75% data for training 
testing = df[ -Train, ] #25% testing

fitControl = trainControl(method="cv",number = 3,preProcOptions = list(thresh = 0.95),classProbs = TRUE,summaryFunction = twoClassSummary)

modelNnet = train(default~.,training, method="nnet",metric="ROC",preProcess=c('center', 'scale'),trace=FALSE,tuneLength=4,trControl=fitControl)
summary(modelNnet)
modelNnet
plot(modelNnet)

predNnet= predict(modelNnet, testing)
cmNnet= confusionMatrix(predNnet, testing$default)
table(predNnet,testing$default)
cmNnet

varImp(modelNnet)

plot(varImp(modelNnet))