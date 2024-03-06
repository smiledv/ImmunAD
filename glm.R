
library(readxl)
CIEP_POS <- read_excel("CIEP.xlsx", 
                   sheet = "Sheet1")
CIEP_POS$aleutex <- (-1)*sqrt(CIEP_POS$qELISA_NS)

CIEP_NEG <- read_excel("CIEP.xlsx", 
                       sheet = "Sheet2")
CIEP_NEG$aleutex <- (-1)*sqrt(CIEP_NEG$qELISA_NS)

mean(CIEP_POS$aleutex)
sd(CIEP_POS$aleutex)
min(CIEP_POS$aleutex)
max(CIEP_POS$aleutex)

(sd(CIEP_POS$aleutex)/mean(CIEP_POS$aleutex))*100


mean(CIEP_NEG$aleutex)
sd(CIEP_NEG$aleutex)
min(CIEP_NEG$aleutex)
max(CIEP_NEG$aleutex)

(sd(CIEP_NEG$aleutex)/mean(CIEP_NEG$aleutex))*100

CIEP <- read_excel("CIEP.xlsx", 
                       sheet = "Sheet3")

model <- glm(CEIP ~ `Blood sample Age` + Color + Sex + Year ,family=binomial(link='logit'), data=CIEP)
summary(model)

#install.packages('aod')
library("aod")
confint.default(model)
#to test color
wald.test(b = coef(model), Sigma = vcov(model), Terms = 44:47)
#to test sex
wald.test(b = coef(model), Sigma = vcov(model), Terms = 48)
#to test year
wald.test(b = coef(model), Sigma = vcov(model), Terms = 49)
