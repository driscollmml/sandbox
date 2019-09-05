#! /usr/local/bin/R

# library
library(ggplot2)
library(readxl)

data_for_R <- read_excel("/Users/tpd0001/github/sandbox/boxy-wCfe_tissues/wCfe-tissues-ANOVA.xlsx")

# balanced design two-way ANOVA
res.aov2 <- aov(copies ~ tissue * target, data = data_for_R)
summary(res.aov2)
TukeyHSD(res.aov2, which = "tissue")
