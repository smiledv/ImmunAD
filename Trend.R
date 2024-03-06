##########################ADRI1######################
data <- data.frame(read.table("DEBV_ID.txt", header=T, sep=""))

# ADRI1 = minus scaled Garrick's DEBV
data <-data[(data[,7]>=0.2),]
data$ADRI1 <- -scale(data$DEBV_Garrick, scale=F)
data <-data[!is.na(data$ADRI1), ]
phen <- data.frame(read.table("phen.txt", header=T, sep=""))
colnames(phen)[1] <- "ID"
phen2 <- phen[!duplicated(phen$ID),]
trend <- merge(data, phen,by="ID")
write.csv(trend, file="ADRI1.csv")
x <- as.data.frame(tapply(trend$ADRI1, trend$Year, mean))

##########################ADRI2######################

data1 <- data.frame(read.table("EBV_ID.txt", header=T, sep=""))
colnames(data1)[4] <- "ID"
data11 <- data.frame(read.table("DEBV_ID.txt", header=T, sep=""))
data1 <- merge (data1, data11, by="ID")
data2 <-data1[(data1[,9]>=0.2),]
data2 <- data2[!is.na(data2$EBV), ]
data2$adj_pheno <- data2$EBV+data2$se
data2$ADRI2 <- -scale(data2$adj_pheno, scale=F)

# the trend of AD resistancy based on DEBV
ped <- data.frame(read.table("ped.txt", header=F, sep=""))
colnames(ped)[1] <- "Animal"
colnames(data2)[1] <- "Animal"
trend1 <- merge(data2, ped,by="Animal")
phen <- data.frame(read.table("phen.txt", header=F, sep=""))
colnames(phen)[1] <- "Animal"
colnames(phen)[6] <- "Year"
trend2 <- merge(trend1, phen,by="Animal")
write.csv(trend2, file="ADRI2.csv")
x <- as.data.frame(tapply(trend2$ADRI2, trend2$Year, mean))

##########################ADRI3######################

data1 <- data.frame(read.table("EBV_ID.txt", header=T, sep=""))
colnames(data1)[4] <- "ID"
data11 <- data.frame(read.table("DEBV_ID.txt", header=T, sep=""))
data1 <- merge (data1, data11, by="ID")
data2 <-data1[(data1[,9]>=0.2),]
data2 <- data2[!is.na(data2$EBV), ]


# ADRI2 = minus scaled adjuste phenotype
data2$ADRI3 <- -scale(data2$EBV, scale=F)
# the trend of AD resistancy based on DEBV
ped <- data.frame(read.table("ped.txt", header=F, sep=""))
colnames(ped)[1] <- "Animal"
colnames(data2)[1] <- "Animal"
trend1 <- merge(data2, ped,by="Animal")
phen <- data.frame(read.table("phen.txt", header=F, sep=""))
colnames(phen)[1] <- "Animal"
colnames(phen)[6] <- "Year"
trend2 <- merge(trend1, phen,by="Animal")
write.csv(trend2, file="ADRI3.csv")
x <- as.data.frame(tapply(trend2$ADRI3, trend2$Year, mean))
