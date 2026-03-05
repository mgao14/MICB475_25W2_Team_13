# March 5th, 2026 Team Meeting
### Agenda

### Update:
- Filtered data by age in QIIME 2, kept only 6-month subset for now
- Exported metadata, rooted-tree, taxonomy, and OTU table, and created a phyloseq object


### Questions Related to the Proposal Revision:


1. Revised Proposal Title Ideas:
Original: Investigating the Effects of Unabsorbed Iron on the Gut Microbiome of Healthy and Anemic Infants Treated with Ferrous Sulfate and Micronutrient Powder Supplementation
Comment: "We want to be careful with this one because you are technically assuming one supplement is better absorbed than the other but we don’t have a direct measure of unabsorbed iron that we are comparing. I would revise the title to better reflect that you are comparing supplements with different absorption efficiencies"

- Exploring/Investigating the Effects of Iron Supplements with Different Absorption Efficiencies on the Gut Microbiome of Healthy and Anemic Infants
- Investigating the Effects of Iron Supplement Formulations on the Gut Microbiome of Healthy and Anemic Infants by Linking Microbial Changes to Iron Absorption Efficiency

2. Revised Proposal Research Question Ideas:
Original: Do different iron absorption levels from iron supplements alter microbial diversity to favour pathogenic bacteria?
Comment: "Maybe flip this around: do iron supplements with different levels of gut absorption efficiency alter… In the metadata, the unabsorbed iron is not directly measured but rather the supplements are annotated so we have to make sure it’s clear what is established that we can compare"

- Do iron supplements with different absorption efficiencies alter/affect gut microbial diversity/composition?
- Do iron supplements with different formulations/absorption efficiencies affect the abundance of pathogenic and beneficial bacteria in the infant gut microbiome?
- Does supplementation with ferrous sulfate, compared to MNP containing ferrous fumarate, vitamin C, and vitamin A, lead to greater overgrowth of iron-dependent pathogenic bacteria?

### Other Questions:
- Would it be better for us to do Indicator Species Analysis for aim 2 as well?
- We already removed ASVs with less than 5 counts in QIIME2. Is it best practice to still filter this in R, or would it be redundant?
- Should we remove samples with less than 100 reads?


