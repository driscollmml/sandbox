#! /usr/local/bin/r

library("ggplot2")

dist.all <- read.table("~/github/sandbox/holos.pwtally.txt", sep = "\t", header=TRUE)
row.names(dist.all) <- dist.all[, 2]

fit <- cmdscale(dist.all[, 3:ncol(dist.all)], eig = TRUE, k = 2)
x <- fit$points[, 1]
y <- fit$points[, 2]

taxon.names <- c("Acromyrmex_echinatior", "Aedes_aegypti", "Aedes_albopictus", "Aethina_tumida", "Agrilus_planipennis", "Amyelois_transitella", "Anopheles_gambiae_str._PEST", "Anoplophora_glabripennis", "Apis_mellifera", "Athalia_rosae", "Atta_cephalotes", "Bactrocera_oleae", "Bicyclus_anynana", "Bombus_impatiens", "Bombyx_mori", "Cephus_cinctus", "Ceratitis_capitata", "Ctenocephalides_felis", "Culex_quinquefasciatus", "Dendroctonus_ponderosae", "Drosophila_melanogaster", "Glossina_morsitans_Yale", "Harpegnathos_saltator", "Helicoverpa_armigera", "Heliothis_virescens", "Hyposmocoma_kahamanoa", "Leptinotarsa_decemlineata", "Linepithema_humile", "Lucilia_cuprina", "Lutzomyia_longipalpis_Jacobina", "Megachile_rotundata", "Musca_domestica", "Nasonia_vitripennis", "Nicrophorus_vespilloides", "Onthophagus_taurus", "Operophtera_brumata", "Oryctes_borbonicus", "Papilio_machaon", "Papilio_polytes", "Papilio_xuthus", "Phlebotomus_papatasi_Israel", "Pieris_rapae", "Plutella_xylostella", "Pogonomyrmex_barbatus", "Rhagoletis_zephyria", "Solenopsis_invicta", "Spodoptera_litura", "Stomoxys_calcitrans", "Tribolium_castaneum", "Trichogramma_pretiosum", "Zeugodacus_cucurbitae")
#qplot(x=x, y=y, data = dist.all, color = dist.all$Group)

qp2 <- plot(x, y, pch=19)
text(x, y, pos = 4, labels = taxon.names)


# autoplot(fit, label=TRUE, label.size = 3, label.colour = "blue")
# 
# 
# plot(x, y, pch = 19, xlim = range(x) + c(0, 600))
# taxon.names <- c("Acromyrmex_echinatior", "Aedes_aegypti", "Aedes_albopictus", "Aethina_tumida", "Agrilus_planipennis", "Amyelois_transitella", "Anopheles_gambiae_str._PEST", "Anoplophora_glabripennis", "Apis_mellifera", "Athalia_rosae", "Atta_cephalotes", "Bactrocera_oleae", "Bicyclus_anynana", "Bombus_impatiens", "Bombyx_mori", "Cephus_cinctus", "Ceratitis_capitata", "Ctenocephalides_felis", "Culex_quinquefasciatus", "Dendroctonus_ponderosae", "Drosophila_melanogaster", "Glossina_morsitans_Yale", "Harpegnathos_saltator", "Helicoverpa_armigera", "Heliothis_virescens", "Hyposmocoma_kahamanoa", "Leptinotarsa_decemlineata", "Linepithema_humile", "Lucilia_cuprina", "Lutzomyia_longipalpis_Jacobina", "Megachile_rotundata", "Musca_domestica", "Nasonia_vitripennis", "Nicrophorus_vespilloides", "Onthophagus_taurus", "Operophtera_brumata", "Oryctes_borbonicus", "Papilio_machaon", "Papilio_polytes", "Papilio_xuthus", "Phlebotomus_papatasi_Israel", "Pieris_rapae", "Plutella_xylostella", "Pogonomyrmex_barbatus", "Rhagoletis_zephyria", "Solenopsis_invicta", "Spodoptera_litura", "Stomoxys_calcitrans", "Tribolium_castaneum", "Trichogramma_pretiosum", "Zeugodacus_cucurbitae")
# text(x, y, pos = 4, labels = taxon.names)
# 
# 
# library(igraph)
# g <- graph.full(nrow(dist.all))
# taxon.names <- c("Acromyrmex_echinatior", "Aedes_aegypti", "Aedes_albopictus", "Aethina_tumida", "Agrilus_planipennis", "Amyelois_transitella", "Anopheles_gambiae_str._PEST", "Anoplophora_glabripennis", "Apis_mellifera", "Athalia_rosae", "Atta_cephalotes", "Bactrocera_oleae", "Bicyclus_anynana", "Bombus_impatiens", "Bombyx_mori", "Cephus_cinctus", "Ceratitis_capitata", "Ctenocephalides_felis", "Culex_quinquefasciatus", "Dendroctonus_ponderosae", "Drosophila_melanogaster", "Glossina_morsitans_Yale", "Harpegnathos_saltator", "Helicoverpa_armigera", "Heliothis_virescens", "Hyposmocoma_kahamanoa", "Leptinotarsa_decemlineata", "Linepithema_humile", "Lucilia_cuprina", "Lutzomyia_longipalpis_Jacobina", "Megachile_rotundata", "Musca_domestica", "Nasonia_vitripennis", "Nicrophorus_vespilloides", "Onthophagus_taurus", "Operophtera_brumata", "Oryctes_borbonicus", "Papilio_machaon", "Papilio_polytes", "Papilio_xuthus", "Phlebotomus_papatasi_Israel", "Pieris_rapae", "Plutella_xylostella", "Pogonomyrmex_barbatus", "Rhagoletis_zephyria", "Solenopsis_invicta", "Spodoptera_litura", "Stomoxys_calcitrans", "Tribolium_castaneum", "Trichogramma_pretiosum", "Zeugodacus_cucurbitae")
# V(g)$label <- taxon.names
# layout <- layout.mds(g, dist = as.matrix(dist.all))
# plot(g, layout = layout, vertex.size = 3)
# 
# 
