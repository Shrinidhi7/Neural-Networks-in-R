data(iris)
names(iris)
summary(iris)
hist(iris$Sepal.Length)
boxplot(iris$Sepal.Length,main="5 Stat Summary of iris",xlab="Sepal Length")
#relation bw 2 variables
plot(iris$Sepal.Length,iris$Sepal.Width)

#PLOTTING CATEGORICAL VARIABLES

counts <- table(iris$Species)
counts
barplot(counts, main="Iris Species", xlab="Samples/species")

barplot(counts, main="Iris Species", xlab="Samples/species",horiz=TRUE)

# relation bw Sepal length and width of 3 different species
qplot(Sepal.Length, Petal.Length, data = iris, color = Species)

# We see that Iris setosa flowers have the narrowest petals.
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width)

qplot(Sepal.Length, Petal.Length, data = iris, color = Species,
      xlab = "Sepal Length", ylab = "Petal Length",
      main = "Sepal vs. Petal Length in Iris data")
qplot(Sepal.Length, Petal.Length, data = iris, geom="line",color = Species,
      xlab = "Sepal Length", ylab = "Petal Length",
      main = "Sepal vs. Petal Length in Iris data")
ggplot(data=iris,aes(x=Sepal.Length,y=Sepal.Width))+geom_point(aes(color=Species))
ggplot(data=iris,aes(x=Sepal.Length,y=Sepal.Width))+geom_bin2d(aes(color=Species))
ggplot(data=iris,aes(x=Sepal.Length,fill=Species))+geom_histogram(aes(color=Species))

ggplot(data=iris,aes(Sepal.Length,Sepal.Width))+geom_point()+facet_grid(.~Species)+geom_smooth(method="lm")
