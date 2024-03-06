library(readxl)
aleutex_ebv <- read_excel("AleuTeX_EBV.xlsx")
elisa <- read_excel("CCFAR ELISA (until 2021) and CIEP (2018 and 2019).xlsx", 
              sheet = "Sheet3")
data <- merge(elisa, aleutex_ebv, by="Animal")
data <- data[!duplicated(data$Animal),]

#all aniamls
library(dplyr)
d <- density(data$EBV) 
plot(d)
sd(data$EBV)
mean(data$EBV)
(mean(data$EBV)+sd(data$EBV))
(mean(data$EBV)-sd(data$EBV))
abline(v=(mean(data$EBV)+sd(data$EBV)))
abline(v=(mean(data$EBV)-sd(data$EBV)))
a <- dplyr::filter(data, EBV < (mean(data$EBV)-sd(data$EBV)))
c <- dplyr::filter(data, EBV > (mean(data$EBV)+sd(data$EBV)))

data$Class <- ifelse(data$EBV > (mean(data$EBV)+sd(data$EBV)), 'HCIR',
                  ifelse(data$EBV  < (mean(data$EBV)-sd(data$EBV)), 'LCIR',
                         ifelse(data$EBV >= (mean(data$EBV)-sd(data$EBV)) & data$EBV <=(mean(data$EBV)+sd(data$EBV)), 'ACIR', 'something else')))

write.csv(data,file = "AleuTeX_class.csv", row.names = F)                         
