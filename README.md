# SAS Statistical Analysis Project - mcparson_Final

## Overview

This repository contains the final project submission for a SAS-based statistical analysis, conducted by Max Parsons. The project features hypothesis testing and regression analysis across two different domains:

- **Housing Market Analysis:** Investigating how basement size and month of sale affect property prices.
- **Supply Chain Pricing Analysis:** Comparing unit prices between shipments from two different countries.

## Files

- `mcparson_Final.sas`: The primary SAS code file used for data import, manipulation, and statistical modeling.
- `mcparson_house.csv`: A housing dataset used in linear regression modeling to predict `SalePrice`.
- `Supply_Chain_Shipment_Pricing_Dataset.csv`: Dataset containing unit prices for a two-sample t-test comparison.
- `Results_ mcparson_Final.pdf`: Output results of the linear regression modeling on housing data.
- `VietnamVZambiaResults_ mcparson_Final.pdf`: Output results of the t-test comparing unit prices from Vietnam and Zambia.

## Methodology

### 1. **Housing Market Analysis (GLM Procedure)**
Using the `mcparson_house.csv` file, a General Linear Model (GLM) was applied:
- **Dependent Variable:** `SalePrice`
- **Independent Variables:** `TotalBsmtSF`, `MoSold`
- **Key Findings:**
  - R² = 0.36, indicating moderate explanatory power.
  - `TotalBsmtSF` has a highly significant positive effect on `SalePrice` (p < .0001).
  - `MoSold` also has a mild but significant influence (p ≈ 0.049).

### 2. **Supply Chain Pricing Comparison (TTEST Procedure)**
Using the `Supply_Chain_Shipment_Pricing_Dataset.csv`, a two-sample t-test was conducted to compare unit prices:
- Two groups were tested based on country of origin.
- Both tests yielded **p-values < 0.0001**, indicating statistically significant differences in mean unit prices between the groups.

## Tools Used

- **Software:** SAS Studio
- **Procedures:** `PROC GLM`, `PROC TTEST`
- **Output:** PDF reports with tabulated test statistics, confidence intervals, and interpretation

## How to Run

1. Open `mcparson_Final.sas` in SAS Studio.
2. Make sure the datasets are uploaded and correctly linked to the file paths.
3. Run each section to replicate the statistical outputs.

## Author

Maxwell (Max) Parsons  
Business Analytics Student at North Carolina State University  
Email: [your email here]

---

> 📌 _Note: All data used in this project is anonymized or publicly available for academic use._
