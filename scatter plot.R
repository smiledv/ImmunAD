library(ggplot2)
library(jtools)
library(readxl)
data <- read_excel("CCFAR ELISA (until 2021) and CIEP (2018 and 2019).xlsx", 
                   sheet = "Sheet3")
data$CEIP<- as.character(data$CEIP)

ggplot(data,aes(x = CEIP, y = qELISA_NS, group = CEIP, fill= CEIP)) +
  geom_boxplot(alpha = .8) +
  guides(fill = "none") +
  theme_bw() +
  labs(
    x = "CEIP",
    y = "ADMV-G ELISA"
  )

data <- read_excel("AleuTeX_class.xlsx")

ggplot(data,aes(x = CIEP_Class, y = EBV, group = CIEP_Class, fill= CIEP_Class)) +
  geom_boxplot(alpha = .8) +
  guides(fill = "none") +
  theme_bw() +
  labs(
    x = "CEIP",
    y = "AleuTeX EBV"
  )

