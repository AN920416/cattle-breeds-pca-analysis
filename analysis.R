library(readr)
library(rrcov)
library(dplyr)
library(ggplot2)
library(factoextra)

setwd("/Users/andywang/Desktop/codes/MVA/Mid")

bulldata <- read_table("bulldata.txt")
summary(bulldata)

bulldata <- bulldata %>%
  mutate(Breed = case_when(
    Breed == 1 ~ "Angus",
    Breed == 5 ~ "Hereford",
    Breed == 8 ~ "Simental"
  ))
angus <- bulldata[bulldata[, 1] == "Angus", 2:9]
hereford <- bulldata[bulldata[, 1] == "Hereford", 2:9]
simental <- bulldata[bulldata[, 1] == "Simental", 2:9]

pairs(bulldata[, -1], col = factor(bulldata$Breed), pch = 16)

plot(angus$YrHgt, angus$Frame)
plot(hereford$YrHgt, hereford$Frame)
plot(simental$YrHgt, simental$Frame)

lm_angus <- lm(angus$Frame ~ angus$YrHgt)
summary(lm_angus)
lm_here <- lm(hereford$Frame ~ hereford$YrHgt)
summary(lm_here)
lm_sim <- lm(simental$Frame ~ simental$YrHgt)
summary(lm_sim)

lm_angus <- lm(angus$Frame ~ angus$SaleHt)
summary(lm_angus)
lm_here <- lm(hereford$Frame ~ hereford$SaleHt)
summary(lm_here)
lm_sim <- lm(simental$Frame ~ simental$SaleHt)
summary(lm_sim)

boxplot(bulldata$YrHgt ~ bulldata$Breed)
aov_yrhgt <- aov(bulldata$YrHgt ~ bulldata$Breed)
summary(aov_yrhgt)

boxplot(bulldata$SalePr ~ bulldata$Breed)
aov_salepr <- aov(bulldata$SalePr ~ bulldata$Breed)
summary(aov_salepr)

mvafit <- manova(
  cbind(SalePr, YrHgt, FtFrBody, PrctFFB, Frame, BkFat, SaleHt, SaleWt) ~ Breed,
  data = bulldata
)
summary(mvafit, test = "Wilk")

pca_all <- prcomp(bulldata[, 2:9], center = TRUE, scale = TRUE)
pca_angus <- prcomp(angus, center = TRUE, scale = TRUE)
pca_here <- prcomp(hereford, center = TRUE, scale = TRUE)
pca_sem <- prcomp(simental, center = TRUE, scale = TRUE)
var_all <- get_pca_var(pca_all)
var_all$contrib

fviz_pca_var(
  pca_all,
  col.var = "contrib",
  gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
  repel = TRUE
)
fviz_pca_var(
  pca_angus,
  col.var = "contrib",
  gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
  repel = TRUE
)
fviz_pca_var(
  pca_here,
  col.var = "contrib",
  gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
  repel = TRUE
)
fviz_pca_var(
  pca_sem,
  col.var = "contrib",
  gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
  repel = TRUE
)

