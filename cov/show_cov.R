#! /usr/local/bin/R

# library
library(ggplot2)
library(readxl)

data_for_R <- read_excel("/Users/tpd0001/github/sandbox/cov/sr_meancov.for_R.xlsx")

p <- ggplot(data_for_R, aes(x=category, y=mean_cov, fill=category)) + geom_violin(trim=TRUE) + xlab("category") + ylab("coverage/base")
#p + stat_summary(fun.y=mean, geom="point", shape=23, size=6)
#p + geom_dotplot(binaxis='y', stackdir='center', dotsize=1)
#p + scale_color_manual(values=c("#00dd00", "#942193"))

#x <- data_for_R[data_for_R$category == "dup",]
#x <- x[[2]]
#y <- data_for_R[data_for_R$category == "single",]
#y <- y[[2]]
#t.test(x,y)

#p + stat_summary(fun.y=mean, geom="point", shape=23, size=3) + coord_flip() + scale_x_discrete(limits=c("sin85", "sin86", "sin87", "sin88", "sin89", "sin90", "sin91", "sin92", "sin93", "sin94", "sin95", "sin96", "sin97", "sin98", "sin99", "sin100", "all"))

#p + stat_summary(fun.y=mean, geom="point", shape=23, size=3) + coord_flip() + scale_x_discrete(limits=c("dup85", "dup86", "dup87", "dup88", "dup89", "dup90", "dup91", "dup92", "dup93", "dup94", "dup95", "dup96", "dup97", "dup98", "dup99", "dup100", "all"))