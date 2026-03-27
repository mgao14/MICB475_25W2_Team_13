### Aim 1
- Changed from classic to bw theme to separate panels
- Which one is a better option, as we do want to unify the theme we use for all graphs & control the number of plots?
- If separate the panels, should we include anemic infant plots only (also for other aims)?

Alpha diversity: Shannon & Faith’s PD (for comprehensive result)
<img width="1121" height="640" alt="Screenshot 2026-03-25 at 8 33 33 PM" src="https://github.com/user-attachments/assets/8fe5f3c9-c55a-45a6-b4c9-17f672eb9573" />


Beta diversity: Weighted Unifrac
- No significance found from PERMANOVA p-value Pr(>F)
  - supplement 0.849
  - anemia        0.924
  - supplement:anemia  0.133

### Aim 2

Thresholds: Abundance = 0.01 and Prevalence 0.3
<img width="710" height="274" alt="Screenshot 2026-03-26 at 3 36 07 PM" src="https://github.com/user-attachments/assets/07be84a2-0ab3-4f61-82ce-5471abfc8cda" />


Indicator species in **anemic** infants.
- Iron‑driven opportunists: Enterobacter, Escherichia‑Shigella, and Clostridium spp. are all high‑affinity iron scavengers. Their simultaneous rise in both FeSO₄ and MNP groups strongly supports the hypothesis that any form of iron (ionic or particulate) creates a niche for fast‑growing, potentially pathogenic bacteria.
- Loss of carbohydrate‑fermenting commensals: Faecalimonas (and, to a lesser extent, the Limosilactobacillus that appears only with MNP) are the taxa that survive when no supplement is given. Their disappearance in iron‑treated infants suggests a shift away from SCFA‑producing, gut‑protective bacteria.
- Potential biomarkers: The ASVs with the highest indicator values (Enterobacter – IndVal 0.91, Staphylococcus – 0.78) could be used as early microbiological markers of iron‑induced dysbiosis in infants at risk of anemia.

Indicator species in **healthy** infants. 
- Strong presence of Bifidobacterium, Lactobacillus, Faecalibacterium, Roseburia, Akkermansia → These are the classic health-associated, SCFA-producing, mucin-interacting taxa that keep the gut environment acidic, limit pathogen expansion and support immune development.
- Different taxa are favoured by FeSO4 vs MNP → Soluble iron (FeSO4) tends to keep Bifidobacterium and Lactobacillus abundant, whereas


### Aim 3

Anemic: 
<img width="3000" height="1800" alt="bar_MNP_vs_None_ANEMIC" src="https://github.com/user-attachments/assets/e9ed810b-7ea9-4378-bcf8-69f88f5e1a70" />
<img width="3000" height="1800" alt="bar_FeSO4_vs_None_ANEMIC" src="https://github.com/user-attachments/assets/b20d15f8-0321-477c-87ce-9d9d672b3f1f" />
<img width="3000" height="1800" alt="bar_MNP_vs_FeSO4_ANEMIC" src="https://github.com/user-attachments/assets/f56cb299-51a8-4e54-a9cc-4e54c7bf646d" />
- FeSO4 vs None: 
  - Upregulated: Enterrococcus, Clostridium innocuum group
  - Downregulated: Bacteriodes, Dorea, Faecalibacterium, Parolsenella, Streptococcus
- MNP vs None: 
  - Upregulated: Catenibacterium, Dorea, Blautia, Bacteriodes.1
  - Downregulated: Leuconostoc, Ruminococcus_gauvereauii, Akkermansia, exitbacter, Faecalmonas, marvinbyrantia, Bacteriodes, peptostreptococcus
- MNP vs FeSO4
  - Upregulated in MNP: Parolsenella, Streptococcus, Bacteroides, Dorea
  - Upregulated in FeSO4: Faecalibacterium
- Bacteroides = first microbes to colonize the human infant gut; it is downregulated when anemic infants take FeSO4; upregulated when taking MNP
- Dorea = appear during first year of infancy, produce SCFAs but at high abundances can cause inflammation or gut barrier changes 
  - Downregulated for FeSO4, upegulated for MNP
- Parolsenella = part of normal adult heatlhy gut; also seen in diverse infant gut microbiomes
  - Increased Parolsenella is associated with metabolic disorders
- Streptococcus = common in early-life gut but less ideal, high abundance is associated with T1D or eczema 

Healthy: 
<img width="3000" height="1800" alt="bar_FeSO4_vs_None_NONANEMIC" src="https://github.com/user-attachments/assets/b85b09bb-2f0f-4515-9e34-841f54ad89cb" />
<img width="3000" height="1800" alt="bar_MNP_vs_None_NONANEMIC" src="https://github.com/user-attachments/assets/5e71fdbf-c3de-49b3-b028-b1ef876d830d" />
<img width="3000" height="1800" alt="bar_MNP_vs_FeSO4_NONANEMIC" src="https://github.com/user-attachments/assets/2edc61ea-76b1-460a-83ff-35ec992754b4" />
- FeSO4 vs None: 
  - Upregulated: Ruminococcus_gauvereauii
  - Downregulated: Limosilactobacillus. 1, __Dorea, __Faecalibacterium, Agathobacter, Ligilactobacillus, Bacteroides, Limosilactobacillus, Anaerobutyricum.1, Other, Eubacterium, Coprococcus, Agathobaculum, Blautia, Erysipelotrichaceae_UCG-003, Peptostreptococcus, Anaerobutyricum, Bifidobacterium
- MNP vs None: 
  - Upregulated: Bifidobacterium, Ruminococcus_gauvereauii
  - Downregulated: Bacteroides, 
- MNP vs FeSO4: 
  - Upregulated in MNP: Bifidobacterium (and .1), Faecalibacterium, Bacteriodes.1, Megasphaera
  - Upregulated in FeSO4: Bacteroides
Bifidobacterium is downregulated when FeSO4 is consumed, upregulated with MNP. This is a crucial, predominant group in a healthy infant gut


Overall, I think the data aligns well with our hypothesis (MNP > FeSO4)

### Aim 4
- Regenerated plots with DESeq2
- Represented pathways by pathway class for clarity (specific names are hard to understand)
<img width="889" height="614" alt="Screenshot 2026-03-25 at 8 38 11 PM" src="https://github.com/user-attachments/assets/abb03bd5-6358-4573-a7f9-71d3cfcd9bd5" />
<img width="906" height="634" alt="Screenshot 2026-03-25 at 8 38 25 PM" src="https://github.com/user-attachments/assets/61f424bd-bc98-44b8-b173-157b7aaed5dc" />
<img width="976" height="693" alt="Screenshot 2026-03-25 at 8 38 39 PM" src="https://github.com/user-attachments/assets/91c4f990-83a6-4720-bb73-3c567490ca86" />
<img width="1014" height="712" alt="Screenshot 2026-03-25 at 8 38 52 PM" src="https://github.com/user-attachments/assets/22df98ae-ea3d-4b13-b48b-08795abe8f0e" />
<img width="706" height="643" alt="Screenshot 2026-03-25 at 8 39 02 PM" src="https://github.com/user-attachments/assets/e2b639de-ed4e-4bf7-b7ad-250fa572cb65" />
<img width="718" height="640" alt="Screenshot 2026-03-25 at 8 39 13 PM" src="https://github.com/user-attachments/assets/9b57fe65-9de0-462a-a888-ce84bf9a5edc" />
<img width="767" height="669" alt="Screenshot 2026-03-25 at 8 39 24 PM" src="https://github.com/user-attachments/assets/75ada0e4-4ade-4f11-9251-e178eef86bfc" />
<img width="793" height="708" alt="Screenshot 2026-03-25 at 8 39 43 PM" src="https://github.com/user-attachments/assets/d42a5f20-78a0-4d86-9dc7-f510d16e485e" />

- Plot with names, some formatting issues
<img width="957" height="783" alt="heatmap with names" src="https://github.com/user-attachments/assets/ec40a060-aaa1-4563-a139-dbc0f0a99709" />

### Meeting Minutes
**Aim 1** 
- Don’t need figure legend for alpha diversity 
- Box on top of whiskers
- Ask ai to change the theme code to give off white background & separate panels
- **Figure 1**: Anemic and healthy - 4 panels, A) Shannon, B) Faith’s PD, C) Bray Curtis, D) Unweighted (doesn’t consider abundance) 

**Aim 2** 
- **Figure 2**: 2 panels, A) Core Microbiome Healthy; B) Core Microbiome Anemic
- Only in the anemic infants, we have more unique taxa (esp feso4)
  - Look whether those core microbiome taxa are unique to high iron environment
  - Enterococcus and Clostridium are fast growers
- ISA: Blast
  - Go to QIIME, look at ASV for clostridium innocuum – BLAST it so that we can see if it’s a true clostridium
  - BLAST all 4 actually - look at refseq file (to get actual taxonomy) - need to go in and change the labels on the table/figure with the actual species name 
- **Table 1** = ISA (with the 4 taxa), **AFTER FIGURE 3, BEFORE FIGURE 4**
  - order family genus stat p value - could also look for species
  - stat value of 0.9 is a very strong indicator of FeSO4? 

**Aim 3**
- **Figure 3**: 3 panels (all anemic) from Deseq A) FeSO4 vs None, B) MNP vs None, C) FeSO4 vs MNP
- **Sup 1**: Healthy figures will be in supplemental information - only if we reference in the manuscript
  - S1a) Healthy, FeSO4 vs none (deseq)
  - S1b) Healthy, MNP vs none (deseq)
  - S1c) Healthy, FeSO4 vs MNP (deseq)
- Use the same colours for deseq plots and picrust plots

**Aim4**
- Put reference on right side of title
- MNP is promoting a higher functional profile? 
- Downregulated pathways are pathways that microbes downregulate with stress
- **Figure 4**: anemic Picrust; A) FeSO4 vs None, B) MNP vs None, C) FeSO4 vs MNP


**Overall Story**
- Slowly narrow things down, eventually focus more on anemic & FeSO4
  - Can still claim MNP has better absorption because the results can be explained by that MNP left less unabsorbed iron for bacteria to use?  
  - Story = no large change in overall community structure, but in anemic infants, for feso4, we’re seeing enrichment in clostridium + also an indicator of feso4 conditions, might not be driving any functional changes
- Enriched /depleted – terminology 
  - Explore only Anemic after deseq
  - Comment on mainly FeSO4
- Manuscript
  - Methods → blasted key microbes with BLAST & Silva

### To do
- Everyone - upload your revised figures to google drive here: 475_Team13
- BLAST sequences for ISA table 
- Draft powerpoint by next Thursday 
- Presenting on Thursday Apr 9

