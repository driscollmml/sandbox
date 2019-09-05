#! /usr/local/bin/R

# library
library(ggplot2)
library(readxl)

data_for_R <- read_excel("/Users/tpd0001/github/sandbox/sr_meancov.for_R.xlsx")

#ggplot(data_for_R, aes(x=as.factor(category), y=coverage)) + geom_boxplot(fill="slateblue", alpha=0.2) + xlab("category") + ylab("coverage/base")
p <- ggplot(data_for_R, aes(x=category, y=coverage, fill=category)) + geom_boxplot(fill="slateblue", alpha=0.2) + xlab("category") + ylab("coverage/base")
p + geom_dotplot(binaxis='y', stackdir='center', dotsize=1)
p + scale_color_manual(values=c("#00dd00", "#942193"))
p

x <- data_for_R[data_for_R$category == "dup",]
x <- x[[2]]
y <- data_for_R[data_for_R$category == "single",]
y <- y[[2]]
t.test(x,y)



	Welch Two Sample t-test

data:  dups and singles
t = -60.117, df = 12930, p-value < 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -64.91723 -60.81760
sample estimates:
mean of dups mean of singles
 112.5556  175.4230 

