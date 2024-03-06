library(readxl)
data <- read_excel("C:/Users/faara/OneDrive/Desktop/CCFAR ELISA (until 2021) and CIEP (2018 and 2019).xlsx", 
                                                             sheet = "Sheet2")

data$CEIP <- as.factor(data$CEIP)
library(ggplot2)

ggplot(data, aes(x = CEIP, y = qELISA_NS, fill = CEIP)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.07, position = position_dodge(width = 0.9))+
  theme(text = element_text(size=20))



library(readxl)
data <- read_excel("C:/Users/faara/OneDrive/Desktop/POS.xlsx")

ggplot(data, aes(x = Class, y = Aleu_EBV, fill = Class)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.07, position = position_dodge(width = 0.9))+
  ylim(-1, 0.5)+
  theme(text = element_text(size=20))


library(readxl)
data <- read_excel("C:/Users/faara/OneDrive/Desktop/NEG.xlsx")

ggplot(data, aes(x = Class, y = Aleu_EBV, fill = Class)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.07, position = position_dodge(width = 0.9))+
  ylim(-1, 0.5)+
  theme(text = element_text(size=20))


library(readxl)
data <- read_excel("C:/Users/faara/OneDrive/Desktop/ALL.xlsx")

ggplot(data, aes(x = Class, y = Aleu_EBV, fill = Class)) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.07, position = position_dodge(width = 0.9))+
  ylim(-1, 0.5)+
  theme(text = element_text(size=20))
