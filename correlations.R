library(readxl)
ebvs_all <- read_excel("all_ebv.xlsx")
ebvs_pos <- read_excel("all_ebv.xlsx", sheet = "Sheet1")
ebvs_neg <- read_excel("all_ebv.xlsx", sheet = "Sheet2")

#with live grade records + all ebv
pelt <- read_excel("CCFAR Live grading.xlsx", 
                   sheet = "Sheet2")
data <- merge(pelt,ebvs_all, by=c("Animal","Dam","Sire","Year","Color","Sex"))
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","Class")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","Live_grade")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","EBV")]),]
cor(data$Aleu_EBV, data$PQ_EBV, method="pearson")
(1-cor(data$Aleu_EBV, data$PQ_EBV, method="pearson"))/sqrt(647-1)

#with live grade records + ebv pos
pelt <- read_excel("CCFAR Live grading.xlsx", 
                   sheet = "Sheet2")
data <- merge(pelt,ebvs_pos, by=c("Animal","Dam","Sire","Year","Color","Sex"))
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","Class")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","Live_grade")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","EBV")]),]
cor(data$Aleu_EBV, data$PQ_EBV, method="pearson")
(1-cor(data$Aleu_EBV, data$PQ_EBV, method="pearson"))/sqrt(495-1)

#with live grade records + ebv neg
pelt <- read_excel("CCFAR Live grading.xlsx", 
                   sheet = "Sheet2")
data <- merge(pelt,ebvs_neg, by=c("Animal","Dam","Sire","Year","Color","Sex"))
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","Class")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","Live_grade")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","EBV")]),]
cor(data$Aleu_EBV, data$PQ_EBV, method="pearson")
(1-cor(data$Aleu_EBV, data$PQ_EBV, method="pearson"))/sqrt(152-1)


#with harvest weight  + ebv all
harvest <- read_excel("FEtraits.xlsx", 
                      sheet = "Sheet2")
data <- merge(harvest,ebvs_all, by=c("Animal","Dam","Year","Color","Sex"))
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HW")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HL")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","EBV")]),]
cor(data$Aleu_EBV, data$HW, method="pearson")
(1-cor(data$Aleu_EBV, data$HW, method="pearson"))/sqrt(444-1)

#with harvest weight + ebv POS
harvest <- read_excel("FEtraits.xlsx", 
                      sheet = "Sheet2")
data <- merge(harvest,ebvs_pos, by=c("Animal","Dam","Year","Color","Sex"))
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HW")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HL")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","EBV")]),]
cor(data$Aleu_EBV, data$HW, method="pearson")
(1-cor(data$Aleu_EBV, data$HW, method="pearson"))/sqrt(392-1)


#with harvest weight + ebv NEG
harvest <- read_excel("FEtraits.xlsx", 
                      sheet = "Sheet2")
data <- merge(harvest,ebvs_neg, by=c("Animal","Dam","Year","Color","Sex"))
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HW")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HL")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","EBV")]),]
cor(data$Aleu_EBV, data$HW, method="pearson")
(1-cor(data$Aleu_EBV, data$HW, method="pearson"))/sqrt(52-1)

#with harvest length  + ebv all
harvest <- read_excel("FEtraits.xlsx", 
                      sheet = "Sheet2")
data <- merge(harvest,ebvs_all, by=c("Animal","Dam","Year","Color","Sex"))
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HW")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HL")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","EBV")]),]
cor(data$Aleu_EBV, data$HL, method="pearson")
(1-cor(data$Aleu_EBV, data$HL, method="pearson"))/sqrt(444-1)

#with harvest length + ebv pos
harvest <- read_excel("FEtraits.xlsx", 
                      sheet = "Sheet2")
data <- merge(harvest,ebvs_pos, by=c("Animal","Dam","Year","Color","Sex"))
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HW")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HL")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","EBV")]),]
cor(data$Aleu_EBV, data$HL, method="pearson")
(1-cor(data$Aleu_EBV, data$HL, method="pearson"))/sqrt(392-1)


#with harvest length + ebv all
harvest <- read_excel("FEtraits.xlsx", 
                      sheet = "Sheet2")
data <- merge(harvest,ebvs_neg, by=c("Animal","Dam","Year","Color","Sex"))
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HW")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","HL")]),]
data <- data[!duplicated(data[c("Animal","Dam","Sire","Year","Color","Sex","EBV")]),]
cor(data$Aleu_EBV, data$HL, method="pearson")
(1-cor(data$Aleu_EBV, data$HL, method="pearson"))/sqrt(52-1)
