#! /usr/local/bin/R

# library
library(ggplot2)
library(readxl)

data_for_R <- read_excel("Desktop/data_for_R.xlsx")

ggplot(data_for_R, aes(x=as.factor(cluster_size), y=val)) + geom_boxplot(fill="slateblue", alpha=0.2) + xlab("sequences in cluster") + scale_y_log10() + ylab("log10 of percent ID threshold")
