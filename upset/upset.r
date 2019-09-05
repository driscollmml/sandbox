library("UpSetR")

ogs <- read.table("~/github/sandbox/holos.stitches.cf_required.upset.txt", sep = "\t", header=TRUE)

#coreS <- function(row, status, score) {data <- (row["coreSiphonaptera"] %in% status) & (row["Siphonaptera(1)"] = score)}
#coreD <- function(row, status, score) {data <- (row["coreDiptera"] %in% status) & (row["Diptera(15)"] = score)}
#coreL <- function(row, status, score) {data <- (row["coreLepidoptera"] %in% status) & (row["Lepidoptera(13)"] = score)}
#coreC <- function(row, status, score) {data <- (row["coreColeoptera"] %in% status) & (row["Coleoptera(9)"] = score)}
#coreH <- function(row, status, score) {data <- (row["coreHymenoptera"] %in% status) & (row["Hymenoptera(13)"] = score)}


#upset(ogs, sets = c("Siphonaptera", "Diptera", "Lepidoptera", "Coleoptera", "Hymenoptera"), keep.order = TRUE, order.by = "freq", sets.bar.color = "#CA6F1E", mb.ratio = c(0.65, 0.35), query.legend  = "top", queries = list(list(query = coreS, params = list(c("yes"), 1), color = "red", active = T, query.name = "All Siphonaptera"), list(query = coreD, params = list(c("yes"), 1), color = "yellow", active = T, query.name = "All Diptera"), list(query = coreL, params = list(c("yes"), 1), color = "green", active = T, query.name = "All Lepidoptera"), list(query = coreC, params = list(c("yes"), 1), color = "blue", active = T, query.name = "All Coleoptera"), list(query = coreH, params = list(c("yes"), 1), color = "violet", active = T, query.name = "All Hymenoptera")))

upset(ogs, sets = c("Siphonaptera", "Diptera", "Lepidoptera", "Coleoptera", "Hymenoptera"), keep.order = TRUE, order.by = "freq", sets.bar.color = "#CA6F1E", mb.ratio = c(0.65, 0.35))


# attribute.plots = list(gridrows = 100, plots = list(list(plot = histogram, x = "uniqueTaxa")), ncols = 1, queries = T), 