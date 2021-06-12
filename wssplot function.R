# wss plot function 
wssplot <- function(data, nc=15, seed=202020)
{
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc) {
    set.seed(seed)
    wss[i] <- sum(kmeans(data,centers = i)$withiness)}
  plot(1:nc,wss,type = "b" ,xlab="Number of clusters",
       ylab = "within groups sum of squares")
}