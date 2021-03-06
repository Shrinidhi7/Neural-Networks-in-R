
boston<-read_excel("C:/Users/lenovo/Documents/DATA/boston1.xls")
data("airquality")
??airquality
aq=na.omit(airquality)
aq2=airquality[complete.cases(airquality), ]
airqual<-airquality

meanOzone=mean(airquality$Ozone,na.rm=T)
# remove NAs while computing mean of Ozone
#with na mean value will be na

aqty.fix=ifelse(is.na(airquality$Ozone),meanOzone,airquality$Ozone)
summary(aqty.fix)
airquality2=airquality
airquality2$Ozone[is.na(airquality2$Ozone)]<-mean(airquality2$Ozone,na.rm=TRUE)
install.packages("mice")
md.pattern(airqual)
library()
install.packages("VIM")
mp <- aggr(airqual, col=c('navyblue','yellow'),
           numbers=TRUE, sortVars=TRUE,
           labels=names(airqual), cex.axis=.7,
          gap=3, ylab=c("Missing data","Pattern"))

im_airqual<- mice(airqual, m=5, maxit = 50, method = 'pmm', seed = 500)
im_airqual$imp$Ozone
completedData <- complete(im_airqual,1)
