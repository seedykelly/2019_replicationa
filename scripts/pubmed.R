rm(list=ls())

library(dplyr)
library(plyr)
library(stringr)

setwd("/Users/clintkelly1/Dropbox/Documents/Projects/Kelly & Lanfear/Data")


#issn values
issn.a_b<-read.csv("issn A-B.csv")
issn.c_h<-read.csv("issn C-H.csv")
issn.I_N<-read.csv("issn I-N.csv")
issn.O_Z<-read.csv("issn O-Z.csv")
data.part_2<-rbind(issn.a_b,issn.c_h,issn.I_N,issn.O_Z)
head(data.part_2)

no.journals<-length(unique(data.part_2$journal.name))
no.papers<-length(unique(data.part_2$file.name))#total number papers  in database

#journal subject categories
categories<-read.csv("ESIMasterJournalList-062017.csv")
head(categories)

# full.issn<-merge(data.part_2,categories,by.x="journal.name",by.y="Full.title")
# write.csv(full.issn,"with titles.csv")

full.epub<-merge(data.part_2,categories,by.x="epub",by.y="ISSN.epub")
length(full.epub$journal.name)#982972 could be categorized

#number of papers in each category
plant_animal<-subset(full.epub, Category_name =="PLANT & ANIMAL SCIENCE")
no.papers.plant_animal<-length(unique(plant_animal$file.name))#number of papers in plant_animal category
no.journals.plant_animal<-length(unique(plant_animal$journal.name))#number of papers in plant_animal category

evo_eco<-subset(full.epub, Category_name =="ENVIRONMENT/ECOLOGY")
no.papers.evo_eco<-length(unique(evo_eco$file.name))#number of papers in eco/enviro category
no.journals.evo_eco<-length(unique(evo_eco$journal.name))#number of papers in eco/enviro category

#replication data
# data.a_b<-read.csv("replication results A_B.csv")
# data.c_h<-read.csv("replication results C_H.csv")
# data.I_N<-read.csv("replication results I_N.csv")
# data.O_Z<-read.csv("replication results O_Z.csv")

data.A_B<-replication_results_A_B
data.C_H<-replication_results_C_H
data.I_N<-replication_results_I_N
data.O_Z<-replication_results_O_Z
data.part_1<-rbind(data.A_B,data.C_H,data.I_N,data.O_Z)

write.csv(data.part_1, file="all replicated studies.csv")

#studies in "all replicated studies.csv" were pared down by hand in Excel by filtering only journals listed in top 500 at scimajor
#this file was then saved as "all replicated studies-Ecology"
studies.ecology<-All_replicated_studies_ECOLOGY
no.papers.replic<-length(unique(studies.ecology$file.name))#4608
no.journals.replic<-length(unique(studies.ecology$journal.name))#71



# #replication data + issn
# data.part_3<-merge(data.part_1,data.part_2,by.x="file.name",by.y="file.name")#this data.frame has issn=NA; categories can be assigned to rows with valid issn
# data.part_3[data.part_3=='NA'] <- NA #need to convert issn=NA to something R can read
# #subset those rows with issn=NA so that we can use epub to assign subject categories
# data.part_3a <- data.part_3[is.na(data.part_3$issn),]
# 
# #replication data + issn + subject categories
# data.part_4<-merge(data.part_3,categories,by.x="issn",by.y="ISSN")#assign categories to rows with issn
# #replication data + epub + subject categories
# data.part_4a<-merge(data.part_3a,categories,by.x="epub",by.y="ISSN.epub")#assign categores to rows with epub (i.e. issn=NA)
# 
# replication.data<-data.part_4[c(-4,-9,-11,-12,-14:-17,-19,-21,-23)]
# replication.data_2<-data.part_4a[c(-4,-9,-11,-12,-14:-17,-19,-21,-23)]
# 
# full.replic.data<-rbind(replication.data,replication.data_2)
# head(full.replic.data)
# 
# plant_animal<-subset(full.replic.data, Category_name =="PLANT & ANIMAL SCIENCE")
# no.papers.plant_animal<-length(unique(plant_animal$file.name))#number of papers in plant_animal category
# 
# evo_eco<-subset(full.replic.data, Category_name =="ENVIRONMENT/ECOLOGY")
# no.papers.evo_eco<-length(unique(evo_eco$file.name))#number of papers in eco/enviro category
# write.csv(evo_eco, file="replication data_ENVIRONMENT_ECOLOGY.csv")

save(full.replic.data, file = "eco.evo.RData")
load("eco.evo.RData")


write.csv(eco.evo.subset, "ESA2017 replication data.csv")


#SUMMARY STATS
# total number of papers
no.papers<-length(unique(plant_animal$file.name))
no.papers

ecology.papers<-Ecologyreplicpapers
no.papers2<-length(unique(ecology.papers$file.name))
no.papers2

no.papers3<-length(unique(multidisciplinary$file.name))
no.papers3

# total number of journals
no.journals<-length(unique(plant_animal$journal.name))
no.journals

no.journals2<-length(unique(ecology.papers$journal.name.x))
no.journals2

no.journals3<-length(unique(multidisciplinary$journal.name.x))
no.journals3

# different categories
subject_categories<-length(unique(category.data$Category_name))

# papers mentioning "replication"
num_replication_papers<-length(unique(category.data$file.name))

# papers in Plant & Animal category
num_animal_papers<-length(unique(plant_animal$file.name))

# papers in Multidisciplinary category
num_multi_papers<-length(unique(multidisciplinary$file.name))

# total number of journals
no.journals_plantanimal<-length(unique(final.data$journal.name))
no.journals_plantanimal


no.papers<-length(unique(eco.evo$file.name))

issn.summary <- ddply(issn.data, c("journal.name"), summarise,
                      N    = length(journal.name)
)
issn.summary

#number of unique journals
no.journals<-length(unique(journal.name))
test_data


#number of papers in each category that mention replic*
plant_animal.replic<-subset(data.part_4, Category_name =="PLANT & ANIMAL SCIENCE")
no.papers.plant_animal.replic<-length(unique(plant_animal.replic$file.name))#number of papers in plant_animal category

evo_eco.replic<-subset(data.part_4, Category_name =="ENVIRONMENT/ECOLOGY")
no.papers.evo_eco.replic<-length(unique(evo_eco.replic$file.name))#number of papers in eco/enviro category
write_csv(evo_eco.replic, "ecoenviroreplic.csv")




#########
new<-issn.a_b
new[c(7)] <- lapply(new[c(7)], function(x) categories$ISSN[match(x, categories$Title29)])
new
options(max.print=250)
print.data.frame(new)
