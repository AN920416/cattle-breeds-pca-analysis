# Dimension Reduction & Underlying Characteristics of Cattle Breeds

## Project Overview

This project applies multivariate statistical analysis to investigate the physiological differences and pricing determinants across distinct cattle breeds (Angus, Hereford, and Simental). The study is conducted in two main stages:

* **Statistical Inference:** Utilizing **MANOVA** and **ANOVA** to identify significant differences in variables (such as Sales Price and Yearling Height) among breeds, and **Linear Regression** to validate correlations between physical attributes.
* **Dimensionality Reduction:** Employing **Principal Component Analysis (PCA)** to reduce dataset complexity into primary indices, facilitating the identification of breed-specific characteristics (e.g., meat production vs. other purposes) through Bi-plot visualization[.

## Key Findings

* **Angus & Hereford:** A positive correlation exists between bull size and sales price, suggesting these breeds are primarily valued for meat production where larger individuals command higher prices.
* **Simental:** The sales price correlates more significantly with back fat content rather than size[cite: 79]. This indicates potential dual-purpose use (e.g., milk production) or that price is dependent on nutritional levels indicated by fat.

## Author

* **Name:** WANG CHAO AN 
* **Department:** Department of Economics 
* **Course:** STAT 5008 Multivariate Statistical Analysis 

## Repository Structure

```text
├── bulldata.txt # Raw cattle characteristics dataset
├── analysis.R  #  Manova, Principal Component Analysis and Bi-plot generation
└── README.md
```

## Tools & Libraries

* **Language:** R
* **Libraries:**
    * `readr`: For efficient data importation.
    * `dplyr`: For data manipulation and cleaning.
    * `rrcov`: For robust covariance estimation and multivariate analysis.
    * `factoextra`: For extracting and visualizing PCA results (Scree plots, Bi-plots).
    * `ggplot2`: For creating data visualizations.