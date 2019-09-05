#! /usr/local/bin/R

# library
library(ggplot2)
library(readxl)

data_for_R <- read_excel("/Users/tpd0001/github/sandbox/boxy-wCfe_tissues/wCfe-tissues.xlsx")

#ggplot(data_for_R, aes(x=as.factor(category), y=coverage)) + geom_boxplot(fill="slateblue", alpha=0.2) + xlab("category") + ylab("coverage/base")
p <- ggplot(data_for_R, aes(x=category, y=copies, fill=category)) + geom_boxplot(fill="slateblue", alpha=0.2) + xlab("category") + ylab("copies")
#p + geom_dotplot(binaxis='y', stackdir='center', dotsize=1)
#p + scale_color_manual(values=c("#00dd00", "#942193"))

#x <- data_for_R[data_for_R$category == "dup",]
#x <- x[[2]]
#y <- data_for_R[data_for_R$category == "single",]
#y <- y[[2]]
#t.test(x,y)

