### Agenda
- QIIME processing, need to select a rarefaction depth
  - Should we select 22901 (maximum balance for retaining features and samples)
  - Or should we go lower which will increase the number of samples preserved
<img width="1349" height="570" alt="image (1)" src="https://github.com/user-attachments/assets/9c3369f6-6cf8-4193-be5e-aace28b77217" />
<img width="1403" height="1109" alt="image" src="https://github.com/user-attachments/assets/8c5c3daa-22ad-4144-8459-879498275d83" />

- Discuss hypothesis points
  - Potential Hypothesis: MNP supplementation may lead to less unabsorbed iron in the colon, potentially reducing overgrowth of pathogenic bacteria compared to ferrous sulfate alone.
  - This is because:
    1. Research shows that a substantial fraction of orally administered iron remains unabsorbed and reaches the colon (iron absorption is greatest in the duodenum)
    2. Differences between iron forms: Ferrous sulfate (FeSO₄) is highly soluble and releases iron rapidly, but without absorption enhancers, a large portion can remain unabsorbed in the colon. This unabsorbed iron may promote the growth of iron-dependent enteropathogens and potentially reduce protective commensals such as Lactobacillus and Bifidobacterium, which generally require little iron.
    3. Advantages of MNP: Assuming the MNP contains ferrous fumarate along with vitamin C, vitamin A, zinc, and folic acid, absorption enhancers like vitamins C and A can increase iron uptake in the duodenum, reducing the fraction of iron that reaches the colon. Although ferrous fumarate is slightly less soluble than ferrous sulfate, its absorption is comparable when adjusted for elemental iron and combined with these enhancers, thereby minimizing impacts on commensal bacteria.
    - Overall: MNP supplementation may improve iron absorption in the small intestine, reducing colonic unabsorbed iron and its potential disruptive effects on the gut microbiome.
   
- Discuss aims
  - Aim 1: Determine how the microbial diversity differs after receiving MPN, FeSO4, or no supplementation in (healthy and anemic) infants. (Diversity matrix + Core microbiome analysis)
  - Aim 2: Identify bacterial species that are differentially abundant upon iron supplementation with MPN or FeSO4 or no supplementation. (DESeq)
  - Aim 3: Functional analyses of bacteria of interest across supplementation (and anemia) status. (PiCRUSt)
   
- Questions:
  - How to cite UJEMI papers
  - Original paper said that samples were collected from 95 infants but the metadata has 180+ samples (we will be analyzing 187 samples) → which number should we use for the introduction/background to state how many samples are there
