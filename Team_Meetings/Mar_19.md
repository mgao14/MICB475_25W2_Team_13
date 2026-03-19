Updated plots / analysis

**Aim 1:**

Alpha diversity: Shannon
- Further tested the interaction between supplement and health status, found no significant difference 
- Also ran Kruskal-Wallis for Faith PD for both health and anemic infants, found no significant difference
- Healthy, Faith PD by supplement: p-value = 0.647
- Anemic, Faith PD by supplement: p-value = 0.4196

<img width="537" height="607" alt="Screenshot 2026-03-18 at 12 02 26 AM" src="https://github.com/user-attachments/assets/11e361c0-55a4-45c5-a063-ffb5164cb1a3" />


Beta diversity: Bray Curtis

<img width="573" height="663" alt="Screenshot 2026-03-18 at 12 02 59 AM" src="https://github.com/user-attachments/assets/e6b09354-e828-43b1-aa10-af1a24616717" />


Beta diversity: Unweighted Unifrac

<img width="603" height="683" alt="Screenshot 2026-03-18 at 12 03 13 AM" src="https://github.com/user-attachments/assets/bedfb0ad-e187-4d4e-9a72-9acbd9669f8b" />

**Aim 4:**
- daa_method: LinDA
- could not do three way comparison, I did pairwise from none vs supplement split by anemia state
results: 
1. normal, none vs MNP
- The filtered data has  36  samples and  6303  features will be tested
- No significant pathways found
2. normal, none vs FeSO4
- The filtered data has  27  samples and  6749  features will be tested
- INFO: KEGG annotation complete: 106 successful, 0 not found, 0 errors
- Filter to p_adjust >= 0.05, abs(log2_fold_change) > 2, 9 remaining significant pathways
3. anemic,  none vs MNP
- The filtered data has  44  samples and  6657  features will be tested
- KEGG annotation complete: 1401 successful, 4 not found, 0 errors
- Filter to p_adjust >= 0.05, abs(log2_fold_change) > 2, 2 remaining significant pathways
4. anemic, none vs FeSO4
- The filtered data has  25  samples and  6519  features will be tested
- KEGG annotation complete: 1 successful, 0 not found, 0 errors
- Filter to p_adjust >= 0.05, abs(log2_fold_change) > 2, 1 remaining significant pathway

Questions




Meeting Minutes




To do


