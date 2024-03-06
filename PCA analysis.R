#install.packages("factoextra")
#install.packages("FactoMineR")
library("factoextra")
library("FactoMineR")
library(readxl)

phen <- read_excel("Aleutex_harvest.xlsx")

df <- data.frame(phen$Class, phen$Harvest_weight, phen$Harvest_length)
res.pca <- PCA(df[,-1],  graph = FALSE)
fviz_pca_ind(res.pca,
             label = "none", # hide individual labels
             habillage = as.factor(df$phen.Class), # color by groups
             palette = c("#00AFBB", "#E7B800", "#FC4E07"),
             addEllipses = TRUE # Concentration ellipses
)



phen <- read_excel("Aleutex_harvest_EBV.xlsx")

df <- data.frame(phen$Class, phen$HW_EBV, phen$HL_EBV)
res.pca <- PCA(df[,-1],  graph = FALSE)
fviz_pca_ind(res.pca,
             label = "none", # hide individual labels
             habillage = as.factor(df$phen.Class), # color by groups
             palette = c("#00AFBB", "#E7B800", "#FC4E07"),
             addEllipses = TRUE # Concentration ellipses
)
