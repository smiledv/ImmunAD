library(readxl)
data <- read_excel("Book1.xlsx")
data$Aleutex <- -(log10(data$qELISA_NS))
mean(data$Aleutex)
sd(data$Aleutex)
shapiro.test(data$Aleutex)
shapiro.test(data$qELISA_NS)

install.packages('nortest')
library(nortest)

ad.test(data$Aleutex)
ad.test(data$qELISA_NS)

ks.test(data$Aleutex, "pnorm", mean=mean(data$Aleutex), sd=sd(data$Aleutex))
ks.test(data$qELISA_NS, "pnorm", mean=mean(data$qELISA_NS), sd=sd(data$qELISA_NS))

data$aleutex2 <- -log5(data$qELISA_NS)
mean(data$aleutex2)
sd(data$aleutex2)
plot(density(data$aleutex2))
plot(density(data$qELISA_NS))
plot(density(data$Aleutex))
shapiro.test(data$aleutex2)

mean(data$qELISA_NS)
sd(data$qELISA_NS)
