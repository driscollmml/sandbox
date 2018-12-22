library("UpSetR")

ogs <- read.table("~/github/sandbox/holo_50.upset.1pct.txt", sep = "\t", header=TRUE)

coreS <- function(row, status, score) {data <- (row["coreSiphonaptera"] %in% status) & (row["Siphonaptera"] = score)}
coreD <- function(row, status, score) {data <- (row["coreDiptera"] %in% status) & (row["Diptera"] = score)}
coreL <- function(row, status, score) {data <- (row["coreLepidoptera"] %in% status) & (row["Lepidoptera"] = score)}
coreC <- function(row, status, score) {data <- (row["coreColeoptera"] %in% status) & (row["Coleoptera"] = score)}
coreH <- function(row, status, score) {data <- (row["coreHymenoptera"] %in% status) & (row["Hymenoptera"] = score)}


upset(ogs, sets = c("Siphonaptera", "Diptera", "Lepidoptera", "Coleoptera", "Hymenoptera"), keep.order = TRUE, order.by = "freq", sets.bar.color = "#CA6F1E", mb.ratio = c(0.65, 0.35), boxplot.summary = c("numOfOrths", "orthsPerTaxon"), query.legend  = "top", queries = list(list(query = coreS, params = list(c("yes"), 1), color = "red", active = T, query.name = "All Siphonaptera"), list(query = coreD, params = list(c("yes"), 1), color = "yellow", active = T, query.name = "All Diptera"), list(query = coreL, params = list(c("yes"), 1), color = "green", active = T, query.name = "All Lepidoptera"), list(query = coreC, params = list(c("yes"), 1), color = "blue", active = T, query.name = "All Coleoptera"), list(query = coreH, params = list(c("yes"), 1), color = "violet", active = T, query.name = "All Hymenoptera")))



# attribute.plots = list(gridrows = 100, plots = list(list(plot = histogram, x = "uniqueTaxa")), ncols = 1, queries = T), 