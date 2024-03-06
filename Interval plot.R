#install.packages("multcompView")
library(multcompView)
library(readxl)

#phenotypes
harvest <- read_excel("Aleutex_harvest.xlsx")
pelt <- read_excel("Aleutex_pelt.xlsx")
PCV <- read_excel("Aleutex_pcv.xlsx", 
                  sheet = "Sheet1")

###########################################
###########################################
###########################################
#harvest weight phen
library(ggplot2)
library(Rmisc)
tgc1 <- summarySE(harvest, measurevar="Harvest_weight", groupvars=c("Class"))
pd <- position_dodge(0.1)
# Use SE
ggplot(tgc1, aes(x=Class, y=Harvest_weight, colour=Color)) + 
  geom_errorbar(aes(ymin=Harvest_weight-se, ymax=Harvest_weight+se), width=.2,size=1, position=pd) +
  geom_point(position=pd, size=3)

#harvest length phen
tgc <- summarySE(harvest, measurevar="Harvest_length", groupvars=c("Class"))
pd <- position_dodge(0.1)
# Use 95% confidence intervals 
ggplot(tgc, aes(x=Class, y=Harvest_length, colour=Color)) + 
  geom_errorbar(aes(ymin=Harvest_length-se, ymax=Harvest_length+se), width=.2,size=1, position=pd) +
  geom_point(position=pd, size=3)

#pelt quality phen
tgc2 <- summarySE(pelt, measurevar="Live_grade", groupvars=c("Class"))
pd <- position_dodge(0.1)
# Use 95% confidence intervals 
ggplot(tgc2, aes(x=Class, y=Live_grade, colour=Color)) + 
  geom_errorbar(aes(ymin=Live_grade-se, ymax=Live_grade+se), width=.2,size=1, position=pd) +
  geom_point(position=pd, size=3)


#PCV phen
tgc <- summarySE(PCV, measurevar="PCV", groupvars=c("Class"))
pd <- position_dodge(0.1)
# Use 95% confidence intervals 
ggplot(tgc, aes(x=Class, y=PCV, colour=Color)) + 
  geom_errorbar(aes(ymin=PCV-se, ymax=PCV+se), width=.2,size=1, position=pd) +
  geom_point(position=pd, size=3)

