### Agenda
- QIIME processing, need to select a rarefaction depth
  - Should we select 22901 (maximum balance for retaining features and samples)
  - Or should we go lower which will increase the number of samples preserved
<img width="1349" height="570" alt="image (1)" src="https://github.com/user-attachments/assets/9c3369f6-6cf8-4193-be5e-aace28b77217" />
<img width="1403" height="1109" alt="image" src="https://github.com/user-attachments/assets/8c5c3daa-22ad-4144-8459-879498275d83" />


Research question: more specific based on hypothesis

Discuss hypothesis
- Potential Hypothesis: FeSO4 supplementation leads to lower iron absorption in the colon, causing overrepresentation of pathogenic bacteria. 
  - This is because:
    1. Research shows that a substantial fraction of orally administered iron remains unabsorbed and reaches the colon (iron absorption is greatest in the duodenum)
    2. Differences between iron forms: Ferrous sulfate (FeSO₄) is highly soluble and releases iron rapidly, but without absorption enhancers, a large portion can remain unabsorbed in the colon. This unabsorbed iron may promote the growth of iron-dependent enteropathogens and potentially reduce protective commensals such as Lactobacillus and Bifidobacterium, which generally require little iron.
    3. Advantages of MNP: Assuming the MNP contains ferrous fumarate along with vitamin C, vitamin A, zinc, and folic acid, absorption enhancers like vitamins C and A can increase iron uptake in the duodenum, reducing the fraction of iron that reaches the colon. Although ferrous fumarate is slightly less soluble than ferrous sulfate, its absorption is comparable when adjusted for elemental iron and combined with these enhancers, thereby minimizing impacts on commensal bacteria.
    - Overall: MNP supplementation may improve iron absorption in the small intestine, reducing colonic unabsorbed iron and its potential disruptive effects on the gut microbiome.

Discuss the 3 aims chosen and whether they are good to move forward with: 
Taxonomic profiling/diversity:
- Aim 1: Determine how the microbial diversity differs after receiving MNP, FeSO4, or no supplementation in (healthy and anemic) infants. (Diversity matrix - alpha/beta) + taxa bar plot
- Aim 2: Identify bacterial species that are differentially abundant upon iron supplementation with MNP or FeSO4 or no supplementation. (DESeq2)
Functional:
- Aim 3: Functional analyses of bacteria of interest across supplementation (and anemia) status. (PiCRUSt)

Overall: MNP supplementation may improve iron absorption in the small intestine, reducing colonic unabsorbed iron and its potential disruptive effects on the gut microbiome.


### Questions:

- How to cite UJEMI papers 
- Original paper said that samples were collected from 95 infants but the metadata has 180+ samples (we will be analyzing 187 samples) → which number should we use for the introduction/background to state how many samples are there
- Everyone to submit the proposal or just one person?


For reference:

<img width="278" height="166" alt="sample_size" src="https://github.com/user-attachments/assets/1af31de7-a683-4d93-930e-9cbe2ff8164d" />

### Meeting Minutes
- Select rarefaction depth
  - Accurate representation of the features (species)
  - Each observed feature corresponds to observe bacteria → choose depth to have uniform representation of the species
  - Retain most number of samples (not undersample) 
  - Go below 22901 → see  if we can get a few samples back
- Research question:
  - Absorption + supplementations
    - Do different iron absorption levels from supplements cause an overrepresentation (overgrowth) of pathogens in the gut microbiome?
  - Supplementation 
    - Do iron supplementation cause an overgrowth of pathogenic bacteria in the gut
    - Do different degrees of iron absorption from diff supplements cause an overgrowth…
    - FeSo4 supplementation causes overrepresentation of pathogenic microbes due to reduced iron absoption
- Hypothesis
  - Use less double negative: less unabsorbed → MNP leads to greater absorption OR FeSO4 leads to reduced absorption / FeSO4 in the colon correlated to overgrowth of pathogenic
  - “Overrepresentation” of pathogenic bacteria (increase in relative abundance) → in general pathogenic/opportunistic bacteria tend to grow faster + appear as higher relative abundance
- Aims: can do more than 3
  - add Aim 2: core microbiome
  - Abundance
- Healthy vs anemic? 
  - the phenotype is independent of condition
- Introduction
  - Iron supplementation for anemic people (unless anemic people absorb more iron)
  - Concept of supplementation and absorption
  - Intro → straight to microbiome and how it relates to our concepts
  - Assumption about MNP → important to include in intro → effect of additional components in absorption should be explained
- Other questions
  - UJEMI: look through examples from last year 
    - It might actually be in the UJEMi paper itself in ASM? – first page bottom right corner
  -  Sample size difference: Authors stated x infants, but the metadata includes x infants, which will be used in our study
  -  1 person hand in for group

