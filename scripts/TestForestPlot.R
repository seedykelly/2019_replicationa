library(forestplot)

# An advanced test
test_data <- data.frame(coef1=c(0.27,0.6873, 2.44, 1.2, 1.52,2.09,0.86,-1.2631,3.8526,-4.39,-1.4537,0.0351,0.97),
                        coef2=c(0.48, 0.1786, -0.21, -0.4,-0.41,-0.28,0.06,-0.2561,1.2985,0.0883,0.0441,0.22,0.1),
                        low1=c(0.1, 0.0569, 1.39, 0.35,0.63,1.11,0.123,-2.3143,2.0745,-5.8485,-2.3022,-0.3547,0.4763),
                        low2=c(0.22, -0.679, -0.79, -0.98,-0.98,-0.86,-0.69,-0.9213,0.5668,-0.3331,-0.5643, -0.06,-0.18 ),
                        high1=c(0.44, 1.3178, 3.49, 2.06,2.42,3.08,1.598,-0.212,5.6307,-2.9325,-0.6052,0.4248,1.4637),
                        high2=c(0.68, 1.0361, 0.36, 0.18,0.17,0.29,0.82,0.4091,2.0303,0.5096,0.6525,0.51, 0.38 ))

col_no <- grep("coef", colnames(test_data))
row_names <- list(
  list("Number of tadpoles transported correlates \nwith distance to deposition pool",
       "Great apes use colour properties to \nindividuate objects", 
       "Domestic dogs show a successive \nnegative contrast (SNC) effect expressed \nin the proportion of rejected food", 
       "","","","Incubation bout length","Do chimps know what others can see?","","Intra-ejaculate differences in fertilization rate","",
      "Pre-mating isolation in Drosophila montana",""),
  list(expression(atop("Ringler et al. 2013","Pasukonis et al. 2016")),
      (expression(atop("Santos et al. 2002","Mendes et al. 2011"))),
      (expression(atop("Bentosela et al. 2009"^"1","Riemer et al. 2016"^"1"))),
      (expression(atop("Bentosela et al. 2009"^"2","Riemer et al. 2016"^"2"))),
      (expression(atop("Bentosela et al. 2009"^"3","Riemer et al. 2016"^"3"))),
      (expression(atop("Bentosela et al. 2009"^"4","Riemer et al. 2016"^"4"))),
      (expression(atop("Cresswell et al. 2003","Bulla et al. 2014"))),
      (expression(atop("Hare et al. 2000"^"1","Karin-D'Arcy and Povinelli 2002"^"1"))),
      (expression(atop("Hare et al. 2000"^"2","Karin-D'Arcy and Povinelli 2002"^"2"))),
      (expression(atop("Cohen and McNaughton 1974"^"1","Fischer and Adams 1981"^"1"))),
      (expression(atop("Cohen and McNaughton 1974"^"2","Fischer and Adams 1981"^"2"))),
      (expression(atop("Jennings et al. 2014"^"1","Ala-Honkola et al. 2016"^"1"))),
      (expression(atop("Jennings et al. 2014"^"2","Ala-Honkola et al. 2016"^"2")))
      ))

coef <- with(test_data, cbind(coef1, coef2))
low <- with(test_data, cbind(low1, low2))
high <- with(test_data, cbind(high1, high2))
forestplot(row_names, coef, low, high,
           xticks=c(-3.5,0,3.5),
           graphwidth = unit(100, 'mm'),
           #grid = structure(c(4^-.5, 4^.5), gp = gpar(col = "steelblue", lty=2)),
           boxsize=0.05,
           #align="r",
           col=fpColors(box=c("royalblue", "orange"),
                        line=c("royalblue", "orange"),
                        summary=c("darkblue", "red")),
           xlab="Effect size",
           new_page = TRUE,
           zero=0, cex=.9, lineheight = "auto", colgap=unit(6,"mm"),
           lwd.ci=2, ci.vertices=FALSE,
           legend=c("Original", "Replication"),
           legend_args = fpLegend(pos = list("topright"),
                                  r = unit(.1, "snpc"),
                                  gp = gpar(col="#CCCCCC", lwd=1.5)))
