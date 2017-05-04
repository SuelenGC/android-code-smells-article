# --------- XML smelly vs limpos por smell
lpa_smelly <- c(5,4,1,3)
lpa_clean <- c(2,0,0,0,0,2,0)

rm_smelly <- c(4,4,3,2,2,0,0,2,0,3,2)
rm_clean <- c(4,3,2,2,1,0,0,0,0)

nrd_smelly <- c(3,2,2,2,1,0,1,1,4,2,2)
nrd_clean <- c(4,0,3,3,0,2,0,3,2)
vioplot(lpa_smelly, lpa_clean, rm_smelly, rm_clean, nrd_smelly, nrd_clean,
        names=c("LPA Cheiroso", "LPA Limpo", "RM Cheiroso", "RM Limpo", "NRD Cheiroso", "NRD Limpo"), col="gold")

wilcox.test(lpa_smelly, lpa_clean)
cliff.delta(lpa_smelly, lpa_clean)

wilcox.test(rm_smelly, rm_clean)
cliff.delta(rm_smelly, rm_clean)

wilcox.test(nrd_smelly, nrd_clean)
cliff.delta(nrd_smelly, nrd_clean)


# --------- all XML smelly vs limpos por smell
xml_smelly <- c(5,4,4,4,3,3,2,2,2,2,2,1,1,0,0,2,0,1,1,4,3,3,0,2,2,2)
xml_clean <- c(3,3,3,2,2,2,1,0,0,0,0,0,0,2,0,0,0,2,0,0,0,2)
vioplot(xml_smelly, xml_clean, names=c("Resource Cheiroso", "Resource Limpo"), col="gold")

wilcox.test(xml_smelly, xml_clean)
cliff.delta(xml_smelly, xml_clean)

# --------- LCUI Smelly vs LCUI limpo vs Smell Tradicionais
lcui_smelly <- c(5,4,1,0,2,4,2,2)
lcui_clean <- c(3,0,0,0,0,3,0,0,0,0,0,0)
traditional_smelly <- c(5,5,4,4,3,3,3,2,2,1,3,5,5,5,3,3,5,5,4)
vioplot(lcui_smelly, lcui_clean, traditional_smelly, names=c("LCUI Cheiroso", "LCUI Limpo", "Cheiros Tradicionais"), col="gold")

wilcox.test(lcui_smelly, lcui_clean)
cliff.delta(lcui_smelly, lcui_clean)

wilcox.test(lcui_smelly, traditional_smelly)
cliff.delta(lcui_smelly, traditional_smelly)

wilcox.test(lcui_clean, traditional_smelly)
cliff.delta(lcui_clean, traditional_smelly)
