#tenemos 2 distintas realizaciones de las funciones(original y mas corta)
#Arbol va a eligir un feature que da gain mas grande(columna 5 de dataset)
#
#by Stanislav Sitanskiy & Oscar Munoz

library(entropy)
library(FSelector)
sys.source("Entropy1.R")
sys.source("Entropy.R")
sys.source("Gain.R")
#sys.source("Gain1.R")


data<-read.table("lenses.data.txt")
fact<-data
#fact=as.data.frame(data)
fact$V2<-as.factor(data[, 2])
fact$V3<-as.factor(data[, 3])
fact$V4<-as.factor(data[, 4])
fact$V5<-as.factor(data[, 5])
fact$V6<-as.factor(data[, 6])

freq<-table(data$V6)/length(data$V6)
entropy.empirical(freq, unit=c("log2"))
Entropy(fact,6)
Entropy1(fact$V6)


information.gain(V6 ~ ., data=fact[,2:6], unit="log2")
ro <- c()
for (a in 2:5){
    #message(a," ", Gain(fact, a,6))
    ro<-c(ro,Gain(fact, a,6))
}
d<-data.frame(colname=c(2:5),Gain=c(ro))
d[d$Gain==max(d$Gain),]

