#Loading packages
library(tidyverse)
library(phyloseq)
library(microbiome)
library(ggVennDiagram)
library("sf")

#### Load data ####
load("../MICB475_anemia_phyloseq_object/anemia_final.RData")

#Create another object to filter the phyloseq object to include only samples where anemia is "anemic" or "normal"
anemia_final_filtered <- subset_samples(anemia_final, anemia %in% c("anemic", "normal"))
View(as.data.frame(sample_data(anemia_final_filtered)))

#### "core" microbiome ####

# Convert to relative abundance
anemia_RA <- transform_sample_counts(anemia_final_filtered, fun=function(x) x/sum(x))

# Filter dataset by anemia status
RA_anemic <- subset_samples(anemia_RA, `anemia`=="anemic")


#### Core Microbiome for ANEMIC Infants ####

# Filter dataset by type of supplement
anemic_sup_none <- subset_samples(RA_anemic, `supplement`=="None")
anemic_sup_MNP <- subset_samples(RA_anemic, `supplement`=="MNP")
anemic_sup_FeSO4 <- subset_samples(RA_anemic, `supplement`=="FeSO4")

# Set a prevalence threshold and abundance threshold. 
# Using a detection threshold of 0.01 (1% relative abundance is considered "abundant") and a prevalence threshold of 0.3 (30% of samples should contain each ASV)
anemic_sup_none_ASVs <- core_members(anemic_sup_none, detection=0.01, prevalence = 0.3)
anemic_sup_MNP_ASVs <- core_members(anemic_sup_MNP, detection=0.01, prevalence = 0.3)
anemic_sup_FeSO4_ASVs <- core_members(anemic_sup_FeSO4, detection=0.01, prevalence = 0.3)

anemic_list_full <- list("No Supplement" = anemic_sup_none_ASVs, MNP = anemic_sup_MNP_ASVs, FeSO4 = anemic_sup_FeSO4_ASVs)

# Create a Venn diagram using all the ASVs shared and unique to anemic infants who received FeSO4, MNP, or no supplementation
anemic_venn <- ggVennDiagram(x = anemic_list_full) + 
  labs(title = "Anemic Infants") +
  scale_x_continuous(expand = expansion(mult = 0.2)) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    plot.margin = margin(t = 30, r = 30, b = 30, l = 30),
    legend.title = element_text(size = 14),
    legend.text  = element_text(size = 12)) 
ggsave("anemic_venn_0.3.png", anemic_venn, width = 5, height = 5)
