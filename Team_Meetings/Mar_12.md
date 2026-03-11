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


Beta diversity: Bray-Curtis

<img width="715" height="708" alt="Screenshot 2026-03-10 at 10 17 49 PM" src="https://github.com/user-attachments/assets/6f569f5c-9b13-46d7-b6ea-ff76250ae405" />

Beta diversity: Unweighted Unifrac

<img width="733" height="837" alt="Screenshot 2026-03-10 at 10 18 14 PM" src="https://github.com/user-attachments/assets/32824514-d804-4b17-aca1-ba84af5aeb08" />

**Aim 4: PICRUSt**
- Warnings from the server:
- Warning: There was only one file for the function: EC
- Maybe that's fine if you used custom traits or there were no sequences matching one of the domains.
- Warning: There was only one file for the function: KO
- Maybe that's fine if you used custom traits or there were no sequences matching one of the domains.
- based on the output files, seems like there’s only bacterial data, should not be a problem

Questions / problems encountered
- Only has 2 data points for anemia infants taking FeSO4 in 6 month subset, not enough to create an ellipse for beta diversity
- How to annotate statistical test results on graphs (geom_signif didn’t work)?


