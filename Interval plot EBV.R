library(multcompView)
library(readxl)
library(Rmisc)
#EBV
harvest <- read_excel("Aleutex_harvest_EBV.xlsx")

pelt <- read_excel("Aleutex_pelt_EBV.xlsx")

PCV <- read_excel("Aleutex_PCV_EBV.xlsx")



###########################################
###########################################
###########################################
#harvest weight phen
library(ggplot2)
library(Rmisc)
tgc1 <- summarySE(harvest, measurevar="HW_EBV", groupvars=c("Class"))
pd <- position_dodge(0.1)
# Use SE
ggplot(tgc1, aes(x=Class, y=HW_EBV, colour=Color)) + 
  geom_errorbar(aes(ymin=HW_EBV-se, ymax=HW_EBV+se), width=.2,size=1, position=pd) +
  geom_point(position=pd, size=3)

#harvest length phen
tgc <- summarySE(harvest, measurevar="HL_EBV", groupvars=c("Class"))
pd <- position_dodge(0.1)
# Use 95% confidence intervals 
ggplot(tgc, aes(x=Class, y=HL_EBV, colour=Color)) + 
  geom_errorbar(aes(ymin=HL_EBV-se, ymax=HL_EBV+se), width=.2,size=1, position=pd) +
  geom_point(position=pd, size=3)

#pelt quality phen
tgc2 <- summarySE(pelt, measurevar="PLQ_EBV", groupvars=c("Class"))
pd <- position_dodge(0.1)
# Use 95% confidence intervals 
ggplot(tgc2, aes(x=Class, y=PLQ_EBV, colour=Color)) + 
  geom_errorbar(aes(ymin=PLQ_EBV-se, ymax=PLQ_EBV+se), width=.2,size=1, position=pd) +
  geom_point(position=pd, size=3)


#PCV phen
tgc <- summarySE(PCV, measurevar="PCV_EBV", groupvars=c("Class"))
pd <- position_dodge(0.1)
# Use 95% confidence intervals 
ggplot(tgc, aes(x=Class, y=PCV_EBV, colour=Color)) + 
  geom_errorbar(aes(ymin=PCV_EBV-se, ymax=PCV_EBV+se), width=.2,size=1, position=pd) +
  geom_point(position=pd, size=3)

