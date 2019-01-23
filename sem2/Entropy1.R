Entropy1 <- function(X) {

freq<-table(X)/length(X)
return(-sum(freq * log2(freq)))
}