#! /usr/local/bin/R

library("gplots")

cols <- c("","Cherry","Chestnut","Oak")
datatab <- read.table("/Users/tpd0001/github/sandbox/chestnut/bygene.C.txt", stringsAsFactors = FALSE, header = FALSE, row.names = 1, col.names = cols, sep = "\t")

datatab.n <- scale(t(datatab))
datatab.tn <- t(datatab.n)
d1 <- dist(datatab.n,method = "euclidean", diag = FALSE, upper = FALSE)
d2 <- dist(datatab.tn,method = "euclidean", diag = FALSE, upper = TRUE)

#c1 <- hclust(d1, method = "ward.D2", members = NULL)
#c2 <- hclust(d2, method = "ward.D2", members = NULL)

par(mfrow=c(2,1),cex=0.5)
plot(d1); plot(d2)
my_palette <- colorRampPalette(c("blue","white","red"))(n = 25)
par(cex.main=0.75)

heatmap.2(datatab.tn,Colv=d1,Rowv=d2,density.info="histogram",trace="none",col = my_palette,cexRow=0.5,cexCol=0.75)
#heatmap.2(datatab.tn,Colv=as.dendrogram(c1),Rowv=d2,density.info="histogram",trace="none",col = my_palette,cexRow=0.5,cexCol=0.75)


# scaled using z=x−μσ

