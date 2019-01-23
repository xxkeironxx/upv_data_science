Gain <- function(X,feature,targetId) {
  # Information Gain Algorithm: Calculates the expected reduction in entropy when choosing one feature
  # 
  # Args:
  #  X: data frame or Matrix
  #  feature: feature selected 
  #  targetId: response/outcome/target/class feature column number
  
  # Gain(D, A) = Entropy(D) −Σa∈V(A)pa· Entropy(Da)
  # pa= |Da|/|D|
  # Da={d∈D|A(d)=a}

  # Returns:
  #  the information gain when splitting X by using feature
if ( is.character(X[, feature]) | is.factor(X[, feature]) ) {
    u.f <- unique(X[, feature]) # Obtains all possible cases from feature in x
    n<-nrow(X)
    r <- c()
    for (f in u.f) {
        #message("enter feature ", f)
        Xf<- X[X[, feature] == f,]
        u.t<-unique(Xf[, targetId])
        freq<-(table(Xf[, targetId])/length(Xf[, targetId]))
		preent<-(-sum(freq * log2(freq), na.rm=TRUE))
        ent<-(preent*nrow(Xf)/n)
		#print(ent)
        r<-c(r,ent)
        }
	#return(-sum(r, na.rm=TRUE))	
    return(Entropy(X,targetId)-sum(r, na.rm=TRUE))
    }
}