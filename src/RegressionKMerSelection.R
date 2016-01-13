computeMeasures <- function(kmer1,extend1){
	chi=0;
	chi1=0;
	exy=extend1[3]
	v=c()
	ex=c(extend1[1],extend1[2])

	res=data.frame(max=23,F=0.2)
	for(i1 in 3:length(kmer1)){
		kmer=kmer1[1:i1]
		extend=extend1[1:i1]
		chi_stat=((extend[i1]-exy)*(extend[i1]-exy))
		chi=chi+chi_stat
		v=c(v,chi)
		ex=c(ex,exy)
		#cat(kmer[i1],"\t",extend[i1],"\t",exy,"\t",chi,"\n")
		res=rbind(res,c(kmer[i1],chi))
		linm = coef(lm(extend~kmer))
		exy=linm[[1]]+kmer1[i1+1]*linm[[2]]
	}
	res=res[-1,]
	return(res)
}

args <- commandArgs(trailingOnly = TRUE)
st<-args[1]
kmer<-as.integer(unlist(strsplit(st,",")))

st1<-args[2]
extend<-as.double(unlist(strsplit(st1,",")))

x=kmer
y=extend

xx<-computeMeasures(x,log10(y))
print(xx)
