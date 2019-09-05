#! /usr/local/bin/R

# library
library(ggplot2)
library(readxl)

data_for_R <- read_excel("/Users/tpd0001/github/sandbox/rickpop/variant_counts.for_R.xlsx")

# balanced design two-way ANOVA
res.aov <- aov(variants ~ passage, data = data_for_R)
summary(res.aov)
TukeyHSD(res.aov, which = "passage")
