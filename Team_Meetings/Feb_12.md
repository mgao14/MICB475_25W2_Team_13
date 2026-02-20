# February 12, 2026 Team Meeting
### QIIME2 Preprocessing So Far:
- Create folder in working directory --> data/project_2_anemia
- Import and demultiplex data --> data/project_2_anemia/demux_seqs.qza
- Create visualization for demultiplexed files --> data/project_2_anemia/demux_seqs.qzv
- Output qzv to visualize on QIIME2 viewer
- Try trimming to: 320

### Things to be decided: 
1. Subset of data to use: 6 or 12 months?
- 12 month data has been used by a previous group -  https://ojs.library.ubc.ca/index.php/UJEMI/article/view/198250 
  - Looking at anemic group only: (and infection status)
  - ​​Analysis  of  fecal  microbial  diversity  based  on  supplementation  status.
    - No significant difference in effect of iron supplementation on  fecal  microbial  diversity across   12-month-old   anemic patients.
  - Analysis of fecal microbial diversity across varying infection statuses.
    - No   significant difference in fecal microbial diversity   across   anemic patients  during  different stages     of     infection.
  - Analysis  of  fecal  microbial  diversity  across  infected  infants  with  or  without  iron supplementation.
    - Significant difference in microbial  diversity  between supplemented    and    non-supplemented  infected  anemic patients.
  - Most papers study infants older than 6 months - might be harder to find resources if use the 6 month subset
    - So according to the other UJEMI paper, we are looking at something different, so I think we can use the 12-month data or both?

2. Aim: Effect of Iron Supplement on Infant Gut Microbiome
   
3. Research Question: How do different iron supplements affect the gut microbiome of infants?
   
- Anemic vs Healthy; Healthy and Anemic
  - MNP vs None
  - FeSO4 vs None
  - MNP vs FeSO4
- Can we stratify by age? Sex?
     
4. Hypothesis: ?

### Background Information on each Iron Supplement:
  MNP:
  - Used to fortify foods
  - Often contains iron (usually in the form of ferrous sulphate, ferrous fumarate, NaFeEDTA, or ferrous bisglycinate) and other vitamins and minerals - Need to determine which form of iron was used and dosage
  - Should contain 12.5mg of elemental iron per sachet (which corresponds to 62.5 mg of ferrous sulfate)
    
  FeSO4:
  - Well-absorbed form of iron - Need to know which type/form (tablet, syrup, etc.) was used to determine accurate iron dosage

### Questions:
- Not able to find info about the iron form used in MNP & dosage of supplements used for the dataset - Does it still allow us to continue with this research question? How will it affect the ways we do our analysis? 
  - Iron form: 
  - Dosage: 
- There are also other categories: e.g. crp (inflammation) or infection status – do we have to account for the change in microbial diversity caused by infections in infected vs non-infected babies as well? Does microbial diversity change because they are infected? What exactly is the infection status?
  - Update: read the other UJEMI paper and they found: No significant difference in fecal microbial diversity across   anemic patients  during  different stages of infection.

### Meeting Notes:
- Don’t need to filter the data for now (no stratification)
  - Start without stratification by age. Could see stronger results between groups
  - If cluster then we can stratify by age
    
- QS: No info on type of iron in MNP and concentration of the treatment used?
  - Leave this behind, can move on
  - State the assumption about what iron and what common minerals are used in MNP → explain why
    - Look at the brand used in the country where the study was done and just state that you are assuming the mineral contents of common brands
  - Also look into what irons are usually used in supplements in general
  - Could be a limitation in our paper: looking at a group that got treatment, but no specific information
    
- Research aim: Examine effect of diff iron supplements on microbiome → How to examine effect?
  - Diversity matrix: alpha or beta (MPN vs FeSO4 → PCoA plot)
    - See how microbiome is changed with different supplements
    - Beta diversity: Good to add ellipses when making a PCoA (5% confidence): to visualize if 2 clusters overlap or not
    - Alpha diversity: can include taxonomic bar plot to see abundance of entire microbial community across samples
  - Core microbiome analysis: main species across samples
  - Indicator species analysis : unique species in a sample
  - DESeq: Differential abundance between species
  - PiCRUSt (functional potential)
    
- Hypothesis: what if there’s not enough existing source to support?
  - Break down the question: iron and iron+vitamins
  - How does iron affect microbes → increase/decrease diversity
  - How do vitamins, Zinc & other elements effect → are they useful for microbes
  - Look at how iron alone or iron with other supplements effect microbes

