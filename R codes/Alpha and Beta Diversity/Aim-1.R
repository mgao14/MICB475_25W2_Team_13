#Load library
library(phyloseq)
library(ape)
library(tidyverse)
library(ggsignif) #for significance test
library(ggforce)
library(vegan) #For PERMANOVA test
library(picante) #For faith PD

#### Load in R Data ####
load("anemia.RData")
load("anemia_rare.RData")

#### Unify theme for plots ####
theme_set(theme_bw())



#### Alpha diversity - Shannon ####

#Statistical test - Kruskal-Wallis

#Extract info
samp_dat_wdiv <- data.frame(sample_data(anemia_rare), estimate_richness(anemia_rare))

#Supplement effect within healthy infants
shan_healthy_kw <- kruskal.test(Shannon ~ supplement, 
                                data = subset(samp_dat_wdiv, anemia == "normal"))
#Supplement effect within anemic infants
shan_anemic_kw <- kruskal.test(Shannon ~ supplement, 
                               data = subset(samp_dat_wdiv, anemia == "anemic"))
#Interaction of supplement and health status
shan_interact_kw <- kruskal.test(Shannon ~ interaction(anemia, supplement), 
                                 data = subset(samp_dat_wdiv))

#Perform log transform ANOVA to confirm that there is no significant difference
#Healthy infants
anova_healthy <- aov(lm(log(Shannon) ~ supplement, 
                        data = subset(samp_dat_wdiv, anemia == "normal")))
summary(anova_healthy)
TukeyHSD(anova_healthy)

#Anemic infants
anova_anemic <- aov(lm(log(Shannon) ~ supplement, 
                        data = subset(samp_dat_wdiv, anemia == "anemic")))
summary(anova_anemic)
TukeyHSD(anova_anemic)

#Interaction
anova_interact <- aov(lm(log(Shannon) ~ interaction(anemia, supplement), 
                        data = subset(samp_dat_wdiv)))
summary(anova_interact)
TukeyHSD(anova_interact)


#Shannon plot - Effect of different supplements on health vs. anemic infants

gg_shannon <- ggplot(samp_dat_wdiv, aes(x = supplement, y = Shannon, fill = supplement)) +
  stat_boxplot(geom = "errorbar", width = 0.2) +
  geom_boxplot() +
  facet_wrap(~ anemia, labeller = as_labeller(c(normal = "Healthy Infants",
                                                anemic = "Anemic Infants"))) +
  labs(x = NULL, y = "Shannon Diversity Measure") +
  scale_x_discrete(labels = c("None" = "No\nsupplement")) +
  geom_signif(comparisons = list(c("MNP","None"), c("MNP", "FeSO4"), c("FeSO4","None")),
              y_position = c(3.1, 2.8, 3.5),
              annotations = c("ns","ns","ns")) + 
  theme(legend.position = "none",
        panel.grid = element_blank(),
        axis.text = element_text(size = 13),
        axis.title = element_text(size = 14),
        strip.text = element_text(size = 14))

gg_shannon

#Save Shannon plot
ggsave(filename = "plot_shannon.png"
       , gg_shannon
       , height=7, width=6)



#### Alpha diversity - Faith PD####

#Calculate Faith's phylogenetic diversity as PD
faith_pd <- pd(t(otu_table(anemia_rare)), phy_tree(anemia_rare), include.root=F)
#Add PD to metadata table
samp_dat_wdiv$FaithPD <- faith_pd$PD


##Statistical test - Kruskal-Wallis
faithpd_healthy_kw <- kruskal.test(FaithPD ~ supplement,
                                   data = subset(samp_dat_wdiv, anemia == "normal"))

faithpd_anemic_kw <- kruskal.test(FaithPD ~ supplement,
                                  data = subset(samp_dat_wdiv, anemia == "anemic"))

faithpd_interact_kw <- kruskal.test(FaithPD ~ interaction(anemia, supplement), 
                                 data = subset(samp_dat_wdiv))

#Perform log transform ANOVA to confirm that there is no significant difference
#Healthy infants
anova_healthy_pd <- aov(lm(log(FaithPD) ~ supplement, 
                        data = subset(samp_dat_wdiv, anemia == "normal")))
summary(anova_healthy_pd)
TukeyHSD(anova_healthy_pd)

#Anemic infants
anova_anemic_pd <- aov(lm(log(FaithPD) ~ supplement, 
                       data = subset(samp_dat_wdiv, anemia == "anemic")))
summary(anova_anemic_pd)
TukeyHSD(anova_anemic_pd)

#Interaction
anova_interact_pd <- aov(lm(log(FaithPD) ~ interaction(anemia, supplement), 
                         data = subset(samp_dat_wdiv)))
summary(anova_interact_pd)
TukeyHSD(anova_interact_pd)


#Faith PD plot
gg_pd <- ggplot(samp_dat_wdiv, aes(x = supplement, y = FaithPD, fill = supplement)) +
  stat_boxplot(geom = "errorbar", width = 0.2) +
  geom_boxplot() +
  facet_wrap(~ anemia, labeller = as_labeller(c(normal = "Healthy Infants",
                                                anemic = "Anemic Infants"))) +
  labs(x = NULL, y = "Faith's Phylogenetic Diversity Measure") +
  scale_x_discrete(labels = c("None" = "No\nsupplement")) +
  geom_signif(comparisons = list(c("MNP","None"), c("MNP", "FeSO4"), c("FeSO4","None")),
              y_position = c(7.4, 7.0, 8.0),
              annotations = c("ns","ns","ns")) +
  theme(legend.position = "none",
        panel.grid = element_blank(),
        axis.text = element_text(size = 13),
        axis.title = element_text(size = 14),
        strip.text = element_text(size = 14))

gg_pd

#Save Faith PD plot
ggsave(filename = "plot_faith_pd.png"
       , gg_pd
       , height=7, width=6)




#### Beta diversity - Bray Curtis####

#Statistical test - PERMANOVA

#Calculate Bray Curtis distance matrix 
dm_bray <- vegdist(t(otu_table(anemia_rare)), method="bray")
#Run PERMANOVA on the matrix
set.seed(123)
bc_PERMANOVA <- adonis2(dm_bray ~ supplement*anemia, data=samp_dat_wdiv, by = "terms")


#Bray Curtis PCoA Plot

#Create PCoA coordinate system
pcoa_bc <- ordinate(anemia_rare, method="PCoA", distance=distance(anemia_rare, method="bray"))

#PCoA plot
gg_bc <- plot_ordination(anemia_rare, pcoa_bc, color = "supplement") +
  labs(col = "Supplement",
       x = "PC1 (32.3%)",
       y = "PC2 (9.9%)") +
  stat_ellipse(aes(group = supplement)) +
  scale_color_discrete(labels = c("None" = "No\nsupplement")) +
  facet_wrap(~ anemia,
             labeller = labeller(anemia = c(normal = "Healthy infants",
                                            anemic = "Anemic infants"))) +
  theme(panel.grid = element_blank(),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 14),
        strip.text = element_text(size = 14),
        legend.text = element_text(size = 12),
        legend.title = element_text(size = 14))

gg_bc

#Save PCoA plot
ggsave("plot_bray_curtis.png"
       , gg_bc
       , height=7, width=7)



#### Beta diversity - Unweighted Unifrac ####

#Statistical Test - PERMANOVA

#Calculate Unweighted Unifrac distance matrix 
dm_unifrac <- UniFrac(anemia_rare, weighted=FALSE)
#Run PERMANOVA on the matrix
set.seed(123)
uf_PERMANOVA <- adonis2(dm_unifrac ~ supplement*anemia, data=samp_dat_wdiv, by = "terms")


#Unweighted Unifrac PCoA plot

#Create PCoA coordinate system
pcoa_uf <- ordinate(anemia_rare, method="PCoA", distance="unifrac")

#PcoA plot
gg_uf <- plot_ordination(anemia_rare, pcoa_uf, color = "supplement") +
  labs(col = "Supplement",
       x = "PC1 (14.2%)",
       y = "PC2 (7.6%)") +
  stat_ellipse(aes(group = supplement)) +
  scale_color_discrete(labels = c("None" = "No\nsupplement")) +
  facet_wrap(~ anemia,
             labeller = labeller(anemia = c(normal = "Healthy infants",
                                            anemic = "Anemic infants"))) +
  theme(panel.grid = element_blank(),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 14),
        strip.text = element_text(size = 14),
        legend.text = element_text(size = 12),
        legend.title = element_text(size = 14))

gg_uf

#Save PCoA plot
ggsave("plot_unweighted_unifrac.png"
       , gg_uf
       , height=7, width=7)


#### Citation ####
citation("phyloseq")
citation("ape")
citation("tidyverse")
citation("ggsignif")
citation("ggforce")
citation("vegan")
citation("picante")

