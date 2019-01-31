# About code and author ---------------------------------------------------

      #title: "Exploratory data analysis, K-means-clustering, KNN"
      #author: "Anupriya Kushwanshi"
      #date: "January 2019"
      #output: "plots and tables"

# Data Definition ---------------------------------------------
install.packages('sqldf')
install.packages("dplyr")
install.packages("ggplot2")
install.packages("car")
install.packages("psych")
install.packages("ggplot2")
library(ggplot2)
library(dplyr)
library(sqldf)
library(datasets)
library(MASS)
library(psych)
library(car)  
library(ggplot2)
data(iris)
dim(iris)
names(iris)
sapply(iris, class)
head(iris)

#check for missing values
apply(iris, 2, function(x) any(is.na(x)))  

#to see total number of species
sqldf('select DISTINCT Species from iris GROUP BY Species')            
attach(iris)

# Summary Statistics ------------------------------------------------------
summary(iris)
apply(iris[1:4], 2, sd)
aggregate(.~Species, iris, mean)
aggregate(.~Species, iris, sd)
aggregate(.~Species, iris, quantile)


# Density plot ------------------------------------------------------------
par(mfrow=c(2,2))
d1 <- ggplot(iris, aes(x = Sepal.Length, fill = Species)) +
  geom_density(alpha=0.7)+ theme_bw()
d2 <- ggplot(iris, aes(x = Sepal.Width,  fill = Species)) +
  geom_density(alpha=0.7)+ theme_bw()
d3 <- ggplot(iris, aes(x = Petal.Length, fill = Species)) +
  geom_density(alpha=0.7)+ theme_bw()
d4 <- ggplot(iris, aes(x = Petal.Width, fill = Species)) +
  geom_density(alpha=0.7)+ theme_bw()

install.packages("cowplot")
library(cowplot)
plot_grid(d1, d2, d3, d4 , ncol=2, nrow=2)


# Scatterplot -------------------------------------------------------------

pairs.panels(iris)                  #psych

# Histograms --------------------------------------------------------------


par(mfrow=c(2,2))
  hist(iris$Sepal.Length, col = "pink")
  hist(iris$Sepal.Width, col = "pink")
  hist(iris$Petal.Length, col = "pink")
  hist(iris$Petal.Width, col = "pink")
  
help(iris)


# K means Clustering ------------------------------------------------------
#Assuming we don't know how many clusters are there for the given dataset
par(mfrow=c(1,2))
plot(Petal.Length~Sepal.Length)
plot(Petal.Width~Sepal.Length)

install.packages("fpc")
install.packages("cluster")
library(cluster)
library(fpc)
par(mfrow=c(2,2))

k3fit <- kmeans(iris[1:4], 3)
plotcluster(iris[1:4], k3fit$cluster)
k3fit$size
k4fit <- kmeans(iris[1:4], 4)
plotcluster(iris[1:4], k4fit$cluster)
k4fit$size
k5fit <- kmeans(iris[1:4],5)
plotcluster(iris[1:4], k5fit$cluster)
k5fit$size
k10fit <- kmeans(iris[1:4],10)
plotcluster(iris[1:4], k10fit$cluster)
k10fit$size

# Choosing the perfect k(elbow method) --------------------------------------------------

# function to compute total within-cluster sum of square ( intra-cluster variation )
set.seed(123)
iris <- scale(iris[1:4])

k.max <- 15
wss <- sapply(1:k.max, 
              function(k)
                {kmeans(iris, k, nstart=50,iter.max = 15 )$tot.withinss})

wss
plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")


# KNN ---------------------------------------------------------------------
install.packages("class")
install.packages('caret')
install.packages('fisheriris')
library(caret)
library(class)
library(tidyverse)
library(stringr)
set.seed(123456)

n <- nrow(iris)
shuffled <- iris[sample(n),]
train <- shuffled[1:round(0.8 * n),]
test <- shuffled[(round(0.8 * n) + 1):n,]
train_label <- train[,5]
test_label <- test[,5]

knn3 <- knn(train[1:4], test[1:4], train_label, k=3)
dim(train)
dim(test)
head(test)
optimum_k=1
for(i in 1:10)
{
  knn_fit <- knn(train[1:4], test[1:4], train_label, k=i)
  print(table(test[,5], knn_fit, dnn = c("True", "Predicted")))
  accuracy <- 100 *(sum(test_label == knn_fit)/NROW(test_label))
  optimum_k[i] <- accuracy
  k=i
  cat(k, '=',  optimum_k[i] )
  cat("\n")
  cat("\n")
  cat("\n")
  
}

#9 is the optimum value of k because of the high accuracy

