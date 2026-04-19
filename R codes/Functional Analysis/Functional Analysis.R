#BiocManager::install("DESeq2")

library(readr)
library(ggpicrust2)
library(tibble)
library(tidyverse)
library(ggprism)
library(patchwork)
library(pheatmap)
library(RColorBrewer)
library(ggplot2)
library(fs)

# Read metadata and filter to 6 months and samples with collected supplements
meta <- read_delim("anemia_metadata.txt") |>
  filter(supplement %in% c("MNP", "FeSO4", "None")) |>
  filter(age_months == 6)

colnames(meta)[1] <- "sampleID"

# Rename supplement groups to be readable by pathway_daa
meta_groups <- meta |>
  mutate(supplement = case_when(
    supplement == 'MNP' ~ 'c',
    supplement == 'FeSO4' ~ 'b',
    supplement == 'None' ~ 'a',
    TRUE ~ supplement # Keeps the original value if no conditions are met
  ))


# Read KO and set column names
KO <- read_delim("KO_pred_metagenome_unstrat.tsv")
KO <- column_to_rownames(KO, var = colnames(KO)[1])

### Filter metadata and KO to comparison groups

# Anemic, MNP vs None
meta_anemic_MNP <- meta_groups |>
  filter(anemia == "anemic") |>
  filter(supplement %in% c("a", "c"))

KO_anemic_MNP <- KO[, colnames(KO) %in% meta_anemic_MNP$sampleID]

# Anemic, FeSO4 vs None
meta_anemic_FeSO4 <- meta_groups |>
  filter(anemia == "anemic") |>
  filter(supplement %in% c("a", "b"))

KO_anemic_FeSO4 <- KO[, colnames(KO) %in% meta_anemic_FeSO4$sampleID]

# Anemic, MNP vs FeSO4
meta_anemic_both <- meta_groups |>
  filter(anemia == "anemic") |>
  filter(supplement %in% c("b", "c"))

KO_anemic_both <- KO[, colnames(KO) %in% meta_anemic_both$sampleID]

### Perform daa using DESEQ

## Anemic, MNP vs None
daa_deseq_anemic_MNP <- pathway_daa(abundance = KO_anemic_MNP,
                              metadata = meta_anemic_MNP,
                              group = "supplement",
                              daa_method = "DESeq2")#,
#reference = "None")

daa_deseq_anemic_MNP_annot <- pathway_annotation(pathway = "KO",
                                           daa_results_df = daa_deseq_anemic_MNP,
                                           ko_to_kegg = TRUE)

#KEGG annotation complete: 1026 successful, 2 not found, 0 errors

# Filter for significant pathways
sig_deseq_anemic_MNP_annot <- daa_deseq_anemic_MNP_annot |>
  filter(p_adjust <= 0.05, abs(log2_fold_change) > 2 , !is.na(pathway_name))
sig_deseq_anemic_MNP_annot %>% nrow() #10

# Rename pathways to human readable
sig_deseq_anemic_MNP_annot_clean <- sig_deseq_anemic_MNP_annot |>
  mutate(
    pathway_class = pathway_class |>
      str_split(";") |>
      lapply(function(x) {
        x <- trimws(x)
        x <- x[-1]
        x <- str_replace(x, "^[0-9]+\\s*", "")
        paste(x, collapse = "; ")
      }) |>
      unlist()
  )
sig_deseq_anemic_MNP_annot_clean$pathway_name <- gsub("\\s*\\[EC:[^]]+\\]$", "",sig_deseq_anemic_MNP_annot_clean$pathway_name)
sig_deseq_anemic_MNP_annot_clean$pathway_class <-
  sig_deseq_anemic_MNP_annot_clean$pathway_class |>
  (\(x) gsub("^Unclassified;\\s*", "", x))() |>
  (\(x) gsub("^Not Included in Pathway or Brite;\\s*", "", x))()

# Plot significant pathways with errorbars
bar_deseq_anemic_MNP_eb <- ggplot(sig_deseq_anemic_MNP_annot_clean, aes(x = reorder(pathway_class, log2_fold_change), y = log2_fold_change, fill = log2_fold_change > 0)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  coord_flip() +  # horizontal bars
  scale_fill_manual(values = c("#CC3C82", "#699CCC"), labels = c("Under-represented","Over-represented")) +
  geom_errorbar(
    stat = "summary",
    fun.data = "mean_se", # Function to calculate mean and standard error
    position = position_dodge(width = 0.9),
    width = 0.2
  ) +
  labs(title = "Anemic, MNP vs No Supplement",
       x = NULL,
       y = "Log2 Fold Change",
       fill = "Direction") +
  theme_classic()+
  theme(legend.position = "none",
        axis.text.y = element_text(size = 15),
        plot.title = element_text(size = 15))
bar_deseq_anemic_MNP_eb

## Anemic, FeSo4 vs None
daa_deseq_anemic_FeSO4 <- pathway_daa(abundance = KO_anemic_FeSO4,
                                metadata = meta_anemic_FeSO4,
                                group = "supplement",
                                daa_method = "DESeq2")#,
                               
# reference = "None")

daa_deseq_anemic_FeSO4_annot <- pathway_annotation(pathway = "KO",
                                             daa_results_df = daa_deseq_anemic_FeSO4,
                                             ko_to_kegg = TRUE)

# KEGG annotation complete: 6 successful, 0 not found, 0 errors

# Filter for significant pathways
sig_deseq_anemic_FeSO4_annot <- daa_deseq_anemic_FeSO4_annot |>
  filter(p_adjust <= 0.05, abs(log2_fold_change) > 2 , !is.na(pathway_name))
sig_deseq_anemic_FeSO4_annot %>% nrow() #6

# Rename pathways to human readable
sig_deseq_anemic_FeSO4_annot_clean <- sig_deseq_anemic_FeSO4_annot |>
  mutate(
    pathway_class = pathway_class |>
      str_split(";") |>
      lapply(function(x) {
        x <- trimws(x)
        x <- x[-1]
        x <- str_replace(x, "^[0-9]+\\s*", "")
        paste(x, collapse = "; ")
      }) |>
      unlist()
  )
sig_deseq_anemic_FeSO4_annot_clean$pathway_name <- gsub("\\s*\\[EC:[^]]+\\]$", "",sig_deseq_anemic_FeSO4_annot_clean$pathway_name)
sig_deseq_anemic_FeSO4_annot_clean$pathway_class <-
  sig_deseq_anemic_FeSO4_annot_clean$pathway_class |>
  (\(x) gsub("^Unclassified;\\s*", "", x))() |>
  (\(x) gsub("^Not Included in Pathway or Brite;\\s*", "", x))()

# Plot significant pathways with errorbars
bar_deseq_anemic_FeSO4_eb <- ggplot(sig_deseq_anemic_FeSO4_annot_clean, aes(x = reorder(pathway_class, log2_fold_change), y = log2_fold_change, fill = log2_fold_change > 0)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  coord_flip() +  # horizontal bars
  scale_fill_manual(values = c("#CC3C82", "#699CCC"), labels = c("Under-represented","Over-represented")) +
  geom_errorbar(
    stat = "summary",
    fun.data = "mean_se", # Function to calculate mean and standard error
    position = position_dodge(width = 0.9),
    width = 0.2
  ) +
  labs(title = "Anemic, FeSO4 vs No Supplement",
       x = NULL,
       y = "Log2 Fold Change",
       fill = "Direction") +
  theme_classic()+
  theme(legend.position = "none",
        axis.text.y = element_text(size = 15),
        plot.title = element_text(size = 15))
bar_deseq_anemic_FeSO4_eb

## Anemic, MNP vs FeSO4
daa_deseq_anemic_both <- pathway_daa(abundance = KO_anemic_both,
                                      metadata = meta_anemic_both,
                                      group = "supplement",
                                      daa_method = "DESeq2")#,
# reference = "None")

daa_deseq_anemic_both_annot <- pathway_annotation(pathway = "KO",
                                                   daa_results_df = daa_deseq_anemic_both,
                                                   ko_to_kegg = TRUE)

# KEGG annotation complete: 1285 successful, 3 not found, 0 errors

# Filter for significant pathways
sig_deseq_anemic_both_annot <- daa_deseq_anemic_both_annot |>
  filter(p_adjust <= 0.05, abs(log2_fold_change) > 2 , !is.na(pathway_name))
sig_deseq_anemic_both_annot %>% nrow() #1189

# Rename pathways to human readable
sig_deseq_anemic_both_annot_clean <- sig_deseq_anemic_both_annot |>
  mutate(
    pathway_class = pathway_class |>
      str_split(";") |>
      lapply(function(x) {
        x <- trimws(x)
        x <- x[-1]
        x <- str_replace(x, "^[0-9]+\\s*", "")
        paste(x, collapse = "; ")
      }) |>
      unlist()
  )
sig_deseq_anemic_both_annot_clean$pathway_name <- gsub("\\s*\\[EC:[^]]+\\]$", "",sig_deseq_anemic_both_annot_clean$pathway_name)
sig_deseq_anemic_both_annot_clean$pathway_class <-
  sig_deseq_anemic_both_annot_clean$pathway_class |>
  (\(x) gsub("^Unclassified;\\s*", "", x))() |>
  (\(x) gsub("^Not Included in Pathway or Brite;\\s*", "", x))()

# Plot significant pathways with errorbars
bar_deseq_anemic_both_eb <- ggplot(sig_deseq_anemic_both_annot_clean, aes(x = reorder(pathway_class, log2_fold_change), y = log2_fold_change, fill = log2_fold_change > 0)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  coord_flip() +  # horizontal bars
  scale_fill_manual(values = c("#CC3C82", "#699CCC"), labels = c("Under-represented","Over-represented")) +
  geom_errorbar(
    stat = "summary",
    fun.data = "mean_se", # Function to calculate mean and standard error
    position = position_dodge(width = 0.9),
    width = 0.2
  ) +
  labs(title = "Anemic, MNP vs FeSO4",
       x = NULL,
       y = "Log2 Fold Change",
       fill = "Direction") +
  theme_classic()+
  theme(legend.position = "none",
        axis.text.y = element_text(size = 13))
bar_deseq_anemic_both_eb
