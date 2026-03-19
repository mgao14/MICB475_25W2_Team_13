Updated plots / analysis

**Aim 1:**

Alpha diversity: Shannon
- Further tested the interaction between supplement and health status, found no significant difference - not able to include in graph, worth doing?
- Ran Kruskal-Wallis for Faith PD for both health and anemic infants, found no significant difference
- Healthy, Faith PD by supplement: p-value = 0.647
- Anemic, Faith PD by supplement: p-value = 0.4196
<img width="999" height="573" alt="Screenshot 2026-03-19 at 1 25 45 PM" src="https://github.com/user-attachments/assets/318c976d-f38c-4807-8ffe-8c2dba3fe04a" />
Interpretation:
- Alpha diversity of gut microbiome did not differ significantly among infants taking different iron supplement for both healthy and anemic groups
- 6-month infants receiving different supplements had similar levels of microbial diversity within their gut microbiomes if considering richness & abundance of microbes in the community. 




Beta diversity:
- Should we do weighted unifrac to replace bray curtis & unweighted unifrac? 

Bray Curtis
<img width="573" height="663" alt="Screenshot 2026-03-18 at 12 02 59 AM" src="https://github.com/user-attachments/assets/e6b09354-e828-43b1-aa10-af1a24616717" />

Unweighted Unifrac
<img width="603" height="683" alt="Screenshot 2026-03-18 at 12 03 13 AM" src="https://github.com/user-attachments/assets/bedfb0ad-e187-4d4e-9a72-9acbd9669f8b" />

Confirm understanding:
- Points spread out, ellipses relatively large
  - High variation / dissimilarity among samples within a supplement group 
- No distinct clustering of points by supplement, strong overlap of ellipses
  - Microbial communities of different iron supplements are likely similar in either anemic or healthy infants (no clear separation).
- Confirming no statistical significance for supplement, health status, and interaction
  - Community composition of gut microbiome does not differ significantly among all comparison groups, considering both richness and abundance / richness and phylogenetic distance
- No ellipse for anemic infants taking FeSO4 but can see the points are still within the range of the other two ellipses?


**Aim 2:**

Set Core Microbiome Threshold to Abundance = 0.01 and Prevalence 0.3
<img width="1015" height="389" alt="Screenshot 2026-03-19 at 1 27 33 PM" src="https://github.com/user-attachments/assets/d91f2ff2-585e-4dba-849e-a3ccc2594fa1" />
- Distribution  of core  microbiome  in  healthy &  anemic  infants  classified  by  supplement group

<img width="989" height="677" alt="Screenshot 2026-03-19 at 1 27 56 PM" src="https://github.com/user-attachments/assets/b3ffdff3-2c30-42d9-9120-f09d6909e2a5" />

List of Unique Taxa Across Supplement Groups:
- Anemic Infants:
  - Unique to MNP: Balutia
  - Unique to FeSO4: 
    - Bacteroides
    - Thomasclavelia
    - [Clostridium]_innocuum_group
    - Eubacterium
- Normal Infants:
  - Unique to MNP: NA
  - Unique to FeSO4: Parolsenella

Core Microbiome Questions:
- Confirm Understanding: The core microbiome shows shared ASVs rather than shared taxonomic groups, correct? Would that explain why we observe repeated taxonomic groups within the same and different supplement groups?
- Why is Streptococcus shared between the MNP and no supplement groups when the prevalence threshold is 0.5, but appears only in the no-supplement group when the threshold is lowered to 0.3 for the anemic infant group?
- Since our hypothesis focuses on comparing bacteria that are unique to FeSO₄ and MNP supplementation, would it be more meaningful to highlight only the taxa exclusive to FeSO₄ and MNP rather than listing all of the taxonomic groups represented by the ASVs in the Venn diagram?
  - Hypothesis: See greater amounts of pathogenic bacteria and lower commensal bacteria with FeSO4 supplementation compared to MNP.


**Aim 3:**
DESeq2 Analysis Plots: https://drive.google.com/file/d/1OKD3LslDeTyhQB1zGfiiP8PxdOmCuirZ/view?usp=sharing

**Aim 4:**
- daa_method: LinDA
- threeway results: 
1. Normal
  - The filtered data has  46  samples and  6881  features will be tested
  - No significant pathways found
2. Anemic
  - The filtered data has  46  samples and  6661  features will be tested
  - KEGG annotation complete: 2261 successful, 6 not found, 0 errors
- from individual pairwise comparisons
1. normal, none vs MNP
  - The filtered data has  36  samples and  6303  features will be tested
  - No significant pathways found
2. normal, none vs FeSO4
  - The filtered data has  27  samples and  6749  features will be tested
  - KEGG annotation complete: 106 successful, 0 not found, 0 errors
  - Filter to p_adjust >= 0.05, abs(log2_fold_change) > 2, 9 remaining significant pathways
3. anemic,  none vs MNP
  - The filtered data has  44  samples and  6657  features will be tested
  - KEGG annotation complete: 1401 successful, 4 not found, 0 errors
  - Filter to p_adjust >= 0.05, abs(log2_fold_change) > 2, 2 remaining significant pathways
4. anemic, none vs FeSO4
  - The filtered data has  25  samples and  6519  features will be tested
  - KEGG annotation complete: 1 successful, 0 not found, 0 errors
  - Filter to p_adjust >= 0.05, abs(log2_fold_change) > 2, 1 remaining significant pathway

Bar Plots
<img width="793" height="662" alt="normal_FeSO4" src="https://github.com/user-attachments/assets/ec86bc0c-f086-421e-97ba-44ea5e669886" />
<img width="793" height="662" alt="anemic_MNP" src="https://github.com/user-attachments/assets/6c8314d7-3537-43a9-825c-94e957884f8d" />
<img width="1000" height="662" alt="anemic_FeSO4" src="https://github.com/user-attachments/assets/89f1c52e-8a8e-4e0a-b3e8-0a725491c3af" />


Questions




Meeting Minutes




To do


