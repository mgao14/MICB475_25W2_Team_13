library(tidyverse)
library(phyloseq)
library(DESeq2)
library(ape)
library(tidyverse)
library(picante)
library(vegan)
library(dplyr)

#### Load data ####
load("anemia_final.RData")
anemia_final

colnames(sample_data(anemia_final))

#### DESeq ####
# Not stratifying by healthy vs anemic yet
## BY SUPPLEMENT
anemia_deseq <- phyloseq_to_deseq2(anemia_final, ~`supplement`)
DESEQ_anemia <- DESeq(anemia_deseq)

# MNP vs None
res_MNP_vs_None <- results(DESEQ_anemia, contrast=c("supplement","MNP","None"))
res_MNP_vs_None <- as.data.frame(res_MNP_vs_None) %>% rownames_to_column("ASV")

# FeSO4 vs None
res_FeSO4_vs_None <- results(DESEQ_anemia, contrast=c("supplement","FeSO4","None"))
res_FeSO4_vs_None <- as.data.frame(res_FeSO4_vs_None) %>% rownames_to_column("ASV")

# MNP vs FeSO4
res_MNP_vs_FeSO4 <- results(DESEQ_anemia, contrast=c("supplement","MNP","FeSO4"))
res_MNP_vs_FeSO4 <- as.data.frame(res_MNP_vs_FeSO4) %>% rownames_to_column("ASV")

#### Volcano plot function ####
make_volcano <- function(res_df, title) {
  res_non_na <- res_df %>% filter(!is.na(padj))
  
  res_non_na %>%
    mutate(significant = padj < 0.01 & abs(log2FoldChange) > 2) %>%
    ggplot(aes(x = log2FoldChange, y = -log10(padj), color = significant)) +
    geom_point() +
    scale_color_manual(values = c("FALSE" = "blue", "TRUE" = "red"),
                       labels = c("Not Significant", 
                                  "Significant (Adj P < 0.01 & |Fold Change| > 2)")) +
    labs(title = title,
         x = "log2 Fold Change",
         y = "-log10 Adjusted P-value",
         color = "Genus Significance") +
    theme_minimal() +
    theme(axis.title.x = element_text(margin = margin(t = 10)),
          axis.title.y = element_text(margin = margin(r = 10)))
}

#### Make volcano plots ####
vol_MNP_None <- make_volcano(res_MNP_vs_None, "MNP vs None")
vol_FeSO4_None <- make_volcano(res_FeSO4_vs_None, "FeSO4 vs None")
vol_MNP_FeSO4 <- make_volcano(res_MNP_vs_FeSO4, "MNP vs FeSO4")

# Save plots
ggsave("results/vol_plot_MNP_None.png", vol_MNP_None, width = 8, height = 6)
ggsave("results/vol_plot_FeSO4_None.png", vol_FeSO4_None, width = 8, height = 6)
ggsave("results/vol_plot_MNP_FeSO4.png", vol_MNP_FeSO4, width = 8, height = 6)

#### ANEMIC ONLY INFANTS VOLCANO PLOTS ####

# Subset to only anemic infants
anemia_only <- subset_samples(anemia_final, anemia == "anemic")
anemia_only_deseq <- phyloseq_to_deseq2(anemia_only, ~`supplement`)
DESEQ_anemia_only <- DESeq(anemia_only_deseq)

# MNP vs None
res_MNP_vs_None_ANEMIC <- results(DESEQ_anemia_only, contrast=c("supplement","MNP","None"))
res_MNP_vs_None_ANEMIC <- as.data.frame(res_MNP_vs_None_ANEMIC) %>% rownames_to_column("ASV")

# FeSO4 vs None
res_FeSO4_vs_None_ANEMIC <- results(DESEQ_anemia_only, contrast=c("supplement","FeSO4","None"))
res_FeSO4_vs_None_ANEMIC <- as.data.frame(res_FeSO4_vs_None_ANEMIC) %>% rownames_to_column("ASV")

# MNP vs FeSO4
res_MNP_vs_FeSO4_ANEMIC <- results(DESEQ_anemia_only, contrast=c("supplement","MNP","FeSO4"))
res_MNP_vs_FeSO4_ANEMIC <- as.data.frame(res_MNP_vs_FeSO4_ANEMIC) %>% rownames_to_column("ASV")

#### Make volcano plots ####
vol_MNP_None_ANEMIC <- make_volcano(res_MNP_vs_None_ANEMIC, "Anemic MNP vs None")
vol_FeSO4_None_ANEMIC <- make_volcano(res_FeSO4_vs_None_ANEMIC, "Anemic FeSO4 vs None")
vol_MNP_FeSO4_ANEMIC <- make_volcano(res_MNP_vs_FeSO4_ANEMIC, "Anemic MNP vs FeSO4")

# Save plots
ggsave("results/vol_plot_MNP_None_ANEMIC.png", vol_MNP_None_ANEMIC, width = 8, height = 6)
ggsave("results/vol_plot_FeSO4_None_ANEMIC.png", vol_FeSO4_None_ANEMIC, width = 8, height = 6)
ggsave("results/vol_plot_MNP_FeSO4_ANEMIC.png", vol_MNP_FeSO4_ANEMIC, width = 8, height = 6)

#### HEALTHY INFANTS VOLCANO PLOTS ####

nonanemia_only <- subset_samples(anemia_final, anemia != "anemic")
nonanemia_only_deseq <- phyloseq_to_deseq2(nonanemia_only, ~`supplement`)
DESEQ_nonanemia_only <- DESeq(nonanemia_only_deseq)

# MNP vs None
res_MNP_vs_None_nonANEMIC <- results(DESEQ_nonanemia_only, contrast=c("supplement","MNP","None"))
res_MNP_vs_None_nonANEMIC <- as.data.frame(res_MNP_vs_None_nonANEMIC) %>% rownames_to_column("ASV")

# FeSO4 vs None
res_FeSO4_vs_None_nonANEMIC <- results(DESEQ_nonanemia_only, contrast=c("supplement","FeSO4","None"))
res_FeSO4_vs_None_nonANEMIC <- as.data.frame(res_FeSO4_vs_None_nonANEMIC) %>% rownames_to_column("ASV")

# MNP vs FeSO4
res_MNP_vs_FeSO4_nonANEMIC <- results(DESEQ_nonanemia_only, contrast=c("supplement","MNP","FeSO4"))
res_MNP_vs_FeSO4_nonANEMIC <- as.data.frame(res_MNP_vs_FeSO4_nonANEMIC) %>% rownames_to_column("ASV")

#### Make volcano plots ####
vol_MNP_None_nonANEMIC <- make_volcano(res_MNP_vs_None_nonANEMIC, "Non-Anemic MNP vs None")
vol_FeSO4_None_nonANEMIC <- make_volcano(res_FeSO4_vs_None_nonANEMIC, "Non-Anemic FeSO4 vs None")
vol_MNP_FeSO4_nonANEMIC <- make_volcano(res_MNP_vs_FeSO4_nonANEMIC, "Non-Anemic MNP vs FeSO4")

# Save plots
ggsave("results/vol_plot_MNP_None_nonANEMIC.png", vol_MNP_None_nonANEMIC, width = 8, height = 6)
ggsave("results/vol_plot_FeSO4_None_nonANEMIC.png", vol_FeSO4_None_nonANEMIC, width = 8, height = 6)
ggsave("results/vol_plot_MNP_FeSO4_nonANEMIC.png", vol_MNP_FeSO4_nonANEMIC, width = 8, height = 6)


#### Create table and barplot of significant genera ####
make_barplot <- function(res_df, physeq_obj, title) {
  
  # Remove NA padj
  res_non_na <- res_df %>% filter(!is.na(padj))
  
  # Filter significant ASVs
  sigASVs <- res_non_na %>% 
    filter(padj < 0.01 & abs(log2FoldChange) > 2)
  
  # Get ASV vector
  sigASVs_vec <- sigASVs$ASV
  
  # Prune phyloseq object
  physeq_sig <- prune_taxa(sigASVs_vec, physeq_obj)
  
  # Merge taxonomy + DESeq results
  sigASVs_annotated <- tax_table(physeq_sig) %>%
    as.data.frame() %>%
    rownames_to_column("ASV") %>%
    right_join(sigASVs, by = "ASV") %>%
    arrange(log2FoldChange) %>%
    mutate(Genus = as.character(Genus)) %>%
    mutate(Genus = ifelse(grepl("^NA", Genus) | is.na(Genus), "Other", Genus)) %>%
    mutate(Genus = make.unique(Genus)) %>%
    mutate(Genus = factor(Genus, levels = unique(Genus)))
  
  # Plot (FLIPPED + NO LEGEND)
  ggplot(sigASVs_annotated) +
    geom_bar(aes(y = Genus,
                 x = log2FoldChange,
                 fill = log2FoldChange > 0),
             stat = "identity") +
    geom_errorbar(aes(y = Genus,
                      xmin = log2FoldChange - lfcSE,
                      xmax = log2FoldChange + lfcSE),
                  width = 0.2) +
    scale_fill_manual(values = c("TRUE" = "#699CCC",
                                 "FALSE" ="#CC3C82")) +
    labs(title = title,
         y = "Genus",
         x = "Log2 Fold Change") +
    theme_classic() +
    theme(
      legend.position = "none",   # REMOVE LEGEND
      axis.text.y = element_text(size = 8)
    )
}

# ALL INFANTS
bar_MNP_None <- make_barplot(res_MNP_vs_None, anemia_final, "MNP vs None")
bar_FeSO4_None <- make_barplot(res_FeSO4_vs_None, anemia_final, "FeSO4 vs None")
bar_MNP_FeSO4 <- make_barplot(res_MNP_vs_FeSO4, anemia_final, "MNP vs FeSO4")

# ANEMIC ONLY
bar_MNP_None_ANEMIC <- make_barplot(res_MNP_vs_None_ANEMIC, anemia_only, "MNP vs No Supplement")
bar_FeSO4_None_ANEMIC <- make_barplot(res_FeSO4_vs_None_ANEMIC, anemia_only, "FeSO4 vs No Supplement")
bar_MNP_FeSO4_ANEMIC <- make_barplot(res_MNP_vs_FeSO4_ANEMIC, anemia_only, "MNP vs FeSO4")

# HEALTHY ONLY
bar_MNP_None_nonANEMIC <- make_barplot(res_MNP_vs_None_nonANEMIC, nonanemia_only, "Healthy MNP vs None")
bar_FeSO4_None_nonANEMIC <- make_barplot(res_FeSO4_vs_None_nonANEMIC, nonanemia_only, "Healthy FeSO4 vs None")
bar_MNP_FeSO4_nonANEMIC <- make_barplot(res_MNP_vs_FeSO4_nonANEMIC, nonanemia_only, "Healthy MNP vs FeSO4")

# save plots
ggsave("results/bar_MNP_vs_None.png", bar_MNP_None, width = 10, height = 6)
ggsave("results/bar_FeSO4_vs_None.png", bar_FeSO4_None, width = 10, height = 6)
ggsave("results/bar_MNP_vs_FeSO4.png", bar_MNP_FeSO4, width = 10, height = 6)

ggsave("results/bar_MNP_vs_None_ANEMIC.png", bar_MNP_None_ANEMIC, width = 6, height = 4)
ggsave("results/bar_FeSO4_vs_None_ANEMIC.png", bar_FeSO4_None_ANEMIC, width = 6, height = 4)
ggsave("results/bar_MNP_vs_FeSO4_ANEMIC.png", bar_MNP_FeSO4_ANEMIC, width = 6, height = 4)

ggsave("results/bar_MNP_vs_None_NONANEMIC.png", bar_MNP_None_nonANEMIC, width = 10, height = 6)
ggsave("results/bar_FeSO4_vs_None_NONANEMIC.png", bar_FeSO4_None_nonANEMIC, width = 10, height = 6)
ggsave("results/bar_MNP_vs_FeSO4_NONANEMIC.png", bar_MNP_FeSO4_nonANEMIC, width = 10, height = 6)

