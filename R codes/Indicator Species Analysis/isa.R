library(tidyverse)
library(phyloseq)
library(indicspecies)
library(openxlsx)

#### Load data ####
load("anemia_final.RData")

# remove NA
anemia_final_filtered <- subset_samples(anemia_final, anemia %in% c("anemic", "normal"))
View(as.data.frame(sample_data(anemia_final_filtered)))

#### Indicator Species/Taxa Analysis ####
# glom to Genus
anemia_genus <- tax_glom(anemia_final_filtered, "Genus", NArm = FALSE)
anemia_genus_RA <- transform_sample_counts(anemia_genus, fun=function(x) x/sum(x))

## anemia or normal
RA_healthy <- subset_samples(anemia_genus_RA, `anemia`=="normal")
#RA_anemic <- subset_samples(anemia_genus_RA, `anemia`=="anemic")

###ISA
  # anemia
#isa_output <- multipatt(t(otu_table(RA_anemic)), cluster = sample_data(RA_anemic)$`supplement`)
#summary(isa_output)
  # healthy
isa_output <- multipatt(t(otu_table(RA_healthy)), cluster = sample_data(RA_healthy)$`supplement`)
summary(isa_output)
taxtable <- tax_table(anemia_final) %>% as.data.frame() %>% rownames_to_column(var="ASV")

# consider that your table is only going to be resolved up to the genus level, be wary of 
# anything beyond the glomed taxa level
isa_output$sign %>%
  rownames_to_column(var="ASV") %>%
  left_join(taxtable) %>%
  filter(p.value<0.05) %>% write.csv("isa_output_healthy.csv", row.names = FALSE)

### Saving
save(isa_output, file="isa.RData")

