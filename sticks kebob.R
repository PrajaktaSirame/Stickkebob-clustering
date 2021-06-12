install.packages("stats")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggiraphExtra")

# Load required libraries 
library(stats)
library(dplyr)
library(ggplot2)
library(ggfortify)

# load data 
all<-read.csv("C://Users//Prajakta//OneDrive//Desktop//homework//Semister 2//customer data//group project 1//stickskebobdata.csv")
# variables used for cluster analysis
cluster.data<- all[,-c(1,2,12:17,28,33,34,35,36,44,55,73,81)]

results<- kmeans (cluster.data,2)
results

# to get optimum no of cluster -within group sum of squares (wss)plot 
wssplot(cluster.data)

# K-means cluster 
KM = kmeans(cluster.data,2)

# cluster plot
autoplot(KM,cluster.data,frame=TRUE)

#cluster center 
KM$centers

#append clusters to the data
cluster.data$clusters<- results$cluster

cluster1<-cluster.data[cluster.data$clusters==1,]
summary(lm(cluster1))

cluster2<-cluster.data[cluster.data$clusters==2,]
summary(lm(cluster.data))
