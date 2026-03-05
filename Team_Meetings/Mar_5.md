# March 5th, 2026 Team Meeting
### Agenda

### Update:
- Filtered data by age in QIIME 2, kept only 6-month subset for now
- Exported metadata, rooted-tree, taxonomy, and OTU table, and created a phyloseq object


### Questions Related to the Proposal Revision:


1. Revised Proposal Title Ideas:

Original: Investigating the Effects of Unabsorbed Iron on the Gut Microbiome of Healthy and Anemic Infants Treated with Ferrous Sulfate and Micronutrient Powder Supplementation

Suggestion: "We want to be careful with this one because you are technically assuming one supplement is better absorbed than the other but we don’t have a direct measure of unabsorbed iron that we are comparing. I would revise the title to better reflect that you are comparing supplements with different absorption efficiencies"

- Exploring/Investigating the Effects of Iron Supplements with Different Absorption Efficiencies on the Gut Microbiome of Healthy and Anemic Infants
- Investigating the Effects of Iron Supplement Formulations on the Gut Microbiome of Healthy and Anemic Infants by Linking Microbial Changes to Iron Absorption Efficiency

2. Revised Proposal Research Question Ideas:

Original: Do different iron absorption levels from iron supplements alter microbial diversity to favour pathogenic bacteria?

Suggestion: "Maybe flip this around: do iron supplements with different levels of gut absorption efficiency alter… In the metadata, the unabsorbed iron is not directly measured but rather the supplements are annotated so we have to make sure it’s clear what is established that we can compare"

- Do iron supplements with different absorption efficiencies alter/affect gut microbial diversity/composition?
- Do iron supplements with different formulations/absorption efficiencies affect the abundance of pathogenic and beneficial bacteria in the infant gut microbiome?
- Does supplementation with ferrous sulfate, compared to MNP containing ferrous fumarate, vitamin C, and vitamin A, lead to greater overgrowth of iron-dependent pathogenic bacteria?

### Other Questions:
Would it be better for us to do Indicator Species Analysis for aim 2 as well?
Combine indicator species analysis (shows which taxa is unique → a stable with ASV) with core microbiome (this generates a ven diagram → abundance threshold 0.01 and prevalence threshold 0.7 - if don’t see difference, need to lower threshold) 
We already removed ASVs with less than 5 counts in QIIME2. Is it best practice to still filter this in R, or would it be redundant?
Stick to 5
Redundancy in the script is not an issue
Should we prune samples with less than 100 reads?
No effect on samples 


### Meeting minutes
1st re-wrote proposal title and question are good
Stick to 6 months for data as it’s well rationalized


### To-do (Meetings: March 12, 19, 26 and April 2, 9)
Presentation (Due April 5th)
Complete data by March 26th (go through all data in March 26th meeting)
Complete slides by April 2nd (polish slides + fix narrative in April 2nd meeting)
Manuscript 



