library(readxl)

pelt <- read_excel("CCFAR Live grading.xlsx", 
                   sheet = "Sheet2")
aleutex <- read_excel("AleuTeX_class.xlsx")
harvest <- read_excel("FEtraits.xlsx", 
                      sheet = "Sheet2")
pcv <- read_excel("CompleteUnivariate CCFAR_MILAD12.03_PCV.xlsx", 
                                           sheet = "Sheet2")

data <- merge(pelt, aleutex, by=c("Animal","Dam","Sire","Year","Color","Sex"), all = T)
data <- merge(data, harvest, by=c("Animal","Dam","Year","Color","Sex"), all = T)
data <- merge(data, pcv, by=c("Animal","Dam","Sire","Year","Color","Sex"), all = T)
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","qELISA_NS","Blood sample Age.x")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","Live_grade")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HW")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HL")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","PCV")]),]

mink <- data

###AleUtex & harvest weight bivariate model

mink <- mink[!is.na(mink$Class),]
mink <- mink[!is.na(mink$HW),]
write.csv(mink,file="Aleutex_harvest.csv",row.names = F)


###AleUtex & pelt quality model

mink <- mink[!is.na(mink$Class),]
mink <- mink[!is.na(mink$Live_grade),]
write.csv(mink,file="Aleutex_pelt.csv",row.names = F)


###Aleutex & PCV 
mink <- mink[!is.na(mink$Class),]
write.csv(mink,file="Aleutex_pcv.csv",row.names = F)

