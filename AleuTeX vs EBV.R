library(readxl)

aleutex <- read_excel("AleuTeX_class.xlsx")
pelt_ebv <- read_excel("LPQ_EBV.xlsx")
colnames(pelt_ebv)[2] <- "PLQ_EBV"
hweight_ebv <- read_excel("HW_EBV.xlsx")
colnames(hweight_ebv)[2] <- "HW_EBV"
hlength_ebv <- read_excel("HL_EBV.xlsx")
colnames(hlength_ebv)[2] <- "HL_EBV"
PCV_ebv <- read_excel("PCV_EBV.xlsx")
colnames(PCV_ebv)[2] <- "PCV_EBV"

data <- merge(aleutex,pelt_ebv, by="Animal")
data <- merge(data,hweight_ebv, by="Animal")
data <- merge(data,hlength_ebv, by="Animal")
data <- merge(data,PCV_ebv, by="Animal")
  
#with live grade records
pelt <- read_excel("CCFAR Live grading.xlsx", 
                   sheet = "Sheet2")
data <- merge(pelt,data, by=c("Animal","Dam","Sire","Year","Color","Sex"))
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","Class")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","Live_grade")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","EBV")]),]

write.csv(data,file="Aleutex_pelt_EBV.csv",row.names = F)


#with harvest weight and length
harvest <- read_excel("FEtraits.xlsx", 
                      sheet = "Sheet2")
data <- merge(harvest,data, by=c("Animal","Dam","Year","Color","Sex"))
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HW")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HL")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","EBV")]),]
write.csv(data,file="Aleutex_harvest_EBV.csv",row.names = F)

#with PCV
pcv <- read_excel("CompleteUnivariate CCFAR_MILAD12.03_PCV.xlsx", 
                          sheet = "Sheet2")
data <- merge(pcv,data, by=c("Animal","Dam","Sire","Year","Color","Sex"))
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","PCV")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","EBV")]),]
data <- data[!duplicated(data[c("Animal")]),]
write.csv(data,file="Aleutex_PCV_EBV.csv",row.names = F)
