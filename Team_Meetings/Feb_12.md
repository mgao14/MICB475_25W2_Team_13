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


### Questions:
- Not able to find info about the iron form used in MNP & dosage of supplements used for the dataset - Does it still allow us to continue with this research question? How will it affect the ways we do our analysis? 
  - Iron form: 
  - Dosage: 
- There are also other categories: e.g. crp (inflammation) or infection status – do we have to account for the change in microbial diversity caused by infections in infected vs non-infected babies as well? Does microbial diversity change because they are infected? What exactly is the infection status?
  - Update: read the other UJEMI paper and they found: No significant difference in fecal microbial diversity across   anemic patients  during  different stages of infection.
