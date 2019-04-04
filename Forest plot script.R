rm(list=ls())


#setwd("~/Documents/Projects/Immune SD meta Kelly et al./Figures/")
## Labels defining subgroups are a little indented!
subgps <- c(subgps <- c(2,3,6,7,10,11,12,13,14,15,16,17))
forestplotdata$Variable[subgps] <- paste(" ",forestplotdata$Variable[subgps]) 
forestplotdata$Variable[subgps]
## Combine the count and percent column
#np <- ifelse(!is.na(forestplotdata$Count), paste(forestplotdata$Count,sep=""), NA)

## The rest of the columns in the table. 
tabletext <-forestplotdata$Variable

library(forestplot)
#str(forestplotdata)
#tiff(file="Meta-regression forest plot.tif",width=10,height=10, units="in",res=350)
#need to run this next bit separately after dev.off...dunno weird....just run next bit on its own at some point
forestplot(labeltext=tabletext, graph.pos=1,
           mean=c(forestplotdata$Point.Estimate), 
           lower=c(forestplotdata$Low), upper=c(forestplotdata$High),
           xticks=c(-3.5,0,3.5),
           #is.summary=c(TRUE,rep(FALSE,2),TRUE,rep(FALSE,15),TRUE,rep(FALSE,9),TRUE, rep(FALSE,3),TRUE,rep(FALSE,3),TRUE),
           graphwidth = unit(100, 'mm'),
           xlab=expression(paste(plain ("Hedges' "), italic ("d"))),
           txt_gp=fpTxtGp(label=gpar(cex=1),
                         ticks=gpar(cex=1.1),
                         xlab=gpar(cex = 1.2),
                         title=gpar(cex = 1.2)),
           col=fpColors(box=c("black", "red","black", "red","black", "red","black", "red","black", "red","black", "red")
                        ,lines="black", zero = "gray50"),
           #legend=c("Original", "Replicate"),
           zero=0, cex=.9, lineheight = "auto", boxsize=0.3, colgap=unit(6,"mm"),
           lwd.ci=2, ci.vertices=FALSE)

dev.off()
help(forestplot)
