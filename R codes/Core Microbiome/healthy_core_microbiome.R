#Loading packages
library(tidyverse)
library(phyloseq)
library(microbiome)
library(ggVennDiagram)
library("sf")

#### Load data ####
load("anemia_final.RData")

#Create another object to filter the phyloseq object to include only samples where anemia is "anemic" or "normal"
anemia_final_filtered <- subset_samples(anemia_final, anemia %in% c("anemic", "normal"))
View(as.data.frame(sample_data(anemia_final_filtered)))

#### "core" microbiome ####

# Convert to relative abundance
anemia_RA <- transform_sample_counts(anemia_final_filtered, fun=function(x) x/sum(x))

# Filter dataset by anemia status
RA_healthy <- subset_samples(anemia_RA, `anemia`=="normal")


#### Core Microbiome for HEALTHY Infants ####

# Filter dataset by type of supplement
healthy_sup_none <- subset_samples(RA_healthy, `supplement`=="None")
healthy_sup_MNP <- subset_samples(RA_healthy, `supplement`=="MNP")
healthy_sup_FeSO4 <- subset_samples(RA_healthy, `supplement`=="FeSO4")

# Set a prevalence threshold and abundance threshold. 
# Using a detection threshold of 0.01 (1% relative abundance is considered "abundant") and a prevalence threshold of 0.3 (30% of samples should contain each ASV)
healthy_sup_none_ASVs <- core_members(healthy_sup_none, detection=0.01, prevalence = 0.3)
healthy_sup_MNP_ASVs <- core_members(healthy_sup_MNP, detection=0.01, prevalence = 0.3)
healthy_sup_FeSO4_ASVs<- core_members(healthy_sup_FeSO4, detection=0.01, prevalence = 0.3)

healthy_list_full <- list("No Supplement" = healthy_sup_none_ASVs, MNP = healthy_sup_MNP_ASVs, FeSO4 = healthy_sup_FeSO4_ASVs)


# Create a Venn diagram using all the ASVs shared and unique to healthy infants who received FeSO4, MNP, or no supplementation
healthy_venn <- ggVennDiagram(x = healthy_list_full) + 
  labs(title = "Healthy Infants") +
  scale_x_continuous(expand = expansion(mult = 0.2)) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 16),
    plot.margin = margin(t = 30, r = 30, b = 30, l = 30),
    legend.title = element_text(size = 14),
    legend.text  = element_text(size = 12))
ggsave("healthy_venn_0.3.png", healthy_venn, width = 5, height = 5)
                                     
