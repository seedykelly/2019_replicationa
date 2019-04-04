

library(powerAnalysis)
library (meta)
library(metafor)
library(compute.es)


#####################
#     CALCULATOR    #
#####################

#chi-squared
chies(0.47, 195, level = 95, cer = 0.2, dig = 2, verbose = TRUE, id=NULL, data=NULL)

#means to hedges
mes(0, 0.209, 0, 0.544, 21, 21,
    level = 95, cer = 0.2, dig = 2, verbose = TRUE, id=NULL, data=NULL)

#transform F-values to g
fes(f=9.18, n.1=24.5, n.2=24.5,dig=4)

#transform proportions to g
propes(p1=0.292,p2=0.708, n.ab=33, n.cd=80,dig = 4)

#transform t-values to g
tes(t=2.575, n.1=16, n.2=16, dig=4)

#transform LOR to g
lores(lor=-0.4054651, var.lor=1.041667, n.1=10,n.2=10)

#transform p to g
pes(p=0.87, n.1=14, n.2=14, tail="two")
pes(p=0.195,n.1=3, n.2=3, tail="two")

#convert raw data to odds LOR and variance
n.1<-2
n.2<-6
n.3<-8
n.4<-4
MI <- matrix(c(n.1, n.2, n.3, n.4), nrow = 2)
dimnames(MI) <- list("Sex" = c("Male","Female"), "Survival" = c("Survived","Died"))
MI
OR<-(n.1*n.3)/(n.2*n.4)
logOR<-log(OR)
Var.LOR<-(1/n.1)+(1/n.2)+(1/n.3)+(1/n.4)
logOR
Var.LOR

#convert 95% CI to SD
N<-13
t<-2*(qt(1-0.05/2, N-1))
x<-0.577
CI<-0.071
UL<-x+CI
LL<-x-CI
SD<-sqrt(N)*(UL-LL)/t
SD

#SE to SD
SE<-0.07
N<-56
SD<-SE * sqrt(N)
SD

#means
mes(m.1=24.72, m.2=22.12, sd.1=3.167, sd.2=3.81, n.1=41, n.2=27, dig=4)

#Mann-Whitney
U<-0
n.1<-20
n.2<-20
x<-U-(n.1*n.2/2)
y<-sqrt((n.1*n.2*(n.1+n.2+1)/12))
z<-x/y
z  

z<-2.03
n<-64
x<-z*sqrt(n)
y<-1-sqrt((z*z)*1/n)
g<-sqrt(x/y)
g       

#one-sample t-test
ES.t.one(m=74.417,sd=14.851,mu=50)

#correlation r
res(.18, var.r = 0.2744, 56,
    level = 95, cer = 0.2, dig = 2, verbose = TRUE, id=NULL, data=NULL)


#SE to var=SE^2*N
SE.var=.07
N.var=56
(SE.var*SE.var)*N.var

sqrt(.26)
