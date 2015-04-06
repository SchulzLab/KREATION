Ftest<- function(fm){
  stat=summary(fm)$fstatistic
  return(-1*log(1-pf(stat[1], stat[2], stat[3])))
}

computeMeasures <- function(x,y){

	res=data.frame(max=23,F=0.2)
	for (i in 3:length(x)){
  		x.s=x[1:i]
  		y.s=y[1:i]
  		fm=lm(y.s~x.s)
  		F=round(Ftest(fm),10)
  		res=rbind(res,c(x.s[i],F))
  	}
  	res=res[-1,]
 	return(res)
}

args <- commandArgs(trailingOnly = TRUE)
st<-args[1]
kmer<-as.integer(unlist(strsplit(st,",")))

st1<-args[2]
extend<-as.integer(unlist(strsplit(st1,",")))

x=kmer
y=extend

xx<-computeMeasures(x,log(y))
print(xx)
