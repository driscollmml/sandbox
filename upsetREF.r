library("UpSetR")

ogs <- read.table("~/github/sandbox/holos.REF.upset.txt", sep = "\t", header=TRUE)

upset(ogs, sets = c("Siphonaptera", "Diptera", "Lepidoptera", "Coleoptera", "Hymenoptera"), keep.order = TRUE, order.by = "freq", sets.bar.color = "#CA6F1E", mb.ratio = c(0.65, 0.35))

# attribute.plots = list(gridrows = 100, plots = list(list(plot = histogram, x = "uniqueTaxa")), ncols = 1, queries = T), 