Update: Plot drafts generated

**Aim 1: Diversity Metrics**

1. Alpha diversity: Shannon

<img width="510" height="672" alt="Screenshot 2026-03-10 at 10 16 57 PM" src="https://github.com/user-attachments/assets/0fe2dc44-6dea-4502-af1c-3dc7c5f6da61" />

<img width="664" height="510" alt="Screenshot 2026-03-10 at 10 17 13 PM" src="https://github.com/user-attachments/assets/b54d6ffb-136a-4197-b712-29f308792a48" />

P-adj values for Shannon Diversity:

Healthy:
- MNP-FeSO4 = 0.0753995
- None-FeSO4 = 0.2091823
- None-MNP = 0.8010462

Anemic: 
- MNP-FeSO4 = 0.9439633
- None-FeSO4 = 0.9987895
- None-MNP = 0.6749216


2. Beta diversity:

Bray-Curtis

<img width="715" height="708" alt="Screenshot 2026-03-10 at 10 17 49 PM" src="https://github.com/user-attachments/assets/6f569f5c-9b13-46d7-b6ea-ff76250ae405" />

PERMANOVA p-value: Pr(>F)
- supplement = 0.517
- anemia = 0.190
- supplement:anemia = 0.589

Unweighted Unifrac

<img width="733" height="837" alt="Screenshot 2026-03-10 at 10 18 14 PM" src="https://github.com/user-attachments/assets/32824514-d804-4b17-aca1-ba84af5aeb08" />

PERMANOVA p-value Pr(>F)
- supplement = 0.844
- anemia = 0.933
- supplement:anemia = 0.145

**Aim 2: Core Microbiome**

Google Drive Link: https://drive.google.com/drive/folders/1EeLoGM7sIXful7VCXSwWhvNU8IJ5GJY_?usp=sharing
- We tried prevalence threshold of 0.5, 0.6, and 0.7

Core Microbiome Update/Questions:
- Very little ASVs after applying the threshold of 0.01 abundance and 0.7 prevalence. Also did 0.5 and 0.6 prevalence.
- Which prevalence threshold should we keep? Do we want to relax the threshold even more?
- Which bar plots are meaningful?

<img width="1199" height="306" alt="Screenshot 2026-03-11 at 4 25 49 PM" src="https://github.com/user-attachments/assets/9e6c16b5-766f-4c29-821e-5e0ddd75f951" />

**AIM 3: DESeq2**
All 6 month infants (both anemic and healthy):
<img width="2400" height="1800" alt="vol_plot_MNP_None" src="https://github.com/user-attachments/assets/6373cf2f-b32f-4f6b-a006-f9481ef4cf13" />
<img width="2400" height="1800" alt="vol_plot_MNP_FeSO4" src="https://github.com/user-attachments/assets/b3ec49d2-03d4-4430-a0f1-09fbd1ae27bc" />
<img width="2400" height="1800" alt="vol_plot_FeSO4_None" src="https://github.com/user-attachments/assets/b7176670-911b-4393-bf5a-0bdb177e5541" />


**Aim 4: PICRUSt**
- Warnings from the server:
- Warning: There was only one file for the function: EC
- Maybe that's fine if you used custom traits or there were no sequences matching one of the domains.
- Warning: There was only one file for the function: KO
- Maybe that's fine if you used custom traits or there were no sequences matching one of the domains.
- based on the output files, seems like there’s only bacterial data, should not be a problem
- which functional database should we use? 
  - pathway/EC/KO
  - Aim 4: Predict microbial metabolic pathways to evaluate changes in community functional potential across iron supplementation and anemia status.
  - pathway is specific to metabolism but should we keep it broader?

**Questions / problems encountered**
- Only has 2 data points for anemia infants taking FeSO4 in 6 month subset, not enough to create an ellipse for beta diversity
- How to annotate statistical test results on graphs (geom_signif didn’t work)?



