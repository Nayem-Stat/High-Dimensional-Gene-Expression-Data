# High-Dimensional Gene Expression Data

## Overview

This repository presents a comprehensive methodological investigation into predictive modeling of obesity status and body mass index (BMI) using high-dimensional gene expression data. The work extends regularized regression and machine learning approaches from moderate-dimensional settings into the extreme high-dimensional regime where the number of predictors substantially exceeds the number of samples (p ≫ n).

## Dataset: GSE27951 Human Adipose Tissue Gene Expression

### Data Source
- **GEO Accession**: GSE27951
- **Title**: Gene-chip studies of adipogenesis-regulated microRNAs in mouse primary adipocytes and human obesity
- **Platform**: Affymetrix Human Genome U133 Plus 2.0 array (GPL570)
- **Original Study**: Keller et al. (2011)

### Dataset Characteristics
- **Sample Size**: 33 human subjects
- **Gene Expression Measurements**: 54,675 probe sets
- **BMI Range**: 16.7–50.2 kg/m² (underweight to severely obese)
- **Obesity Classification**: 17 obese (BMI ≥ 30) vs. 16 non-obese (near-balanced)

### Clinical and Anthropometric Covariates
- Age
- Body Mass Index (BMI)
- Clinical glycaemic status (NGT, IGT, or DM)
- Fasting plasma glucose
- Fasting insulin
- Glycated haemoglobin (HbA1c)
- Maximal oxygen uptake normalised to fat-free mass (VO2max/FFM)

### Methodological Significance
This dataset exemplifies the canonical p ≫ n high-dimensional setting where:
- The design matrix is rank-deficient
- Ordinary least squares estimation is mathematically undefined
- Regularized estimators and dimension reduction are essential rather than optional
- Multicollinearity among predictors is pervasive and structural

## Research Motivation and Gap

### Existing Literature Limitations
Previous analyses of GSE27951 (e.g., Dong et al., 2021) have relied predominantly on:
- Differential gene expression testing
- Network-topology-based gene prioritization
- Bioinformatics pipelines without formal high-dimensional regression modeling

### Research Contributions
This work addresses the gap by:
1. **Benchmarking regularized estimators** on genuinely high-dimensional real biological data
2. **Characterizing predictive and coefficient-stability performance** in extreme multicollinearity
3. **Evaluating hybrid regularization–machine-learning approaches** in the p ≫ n regime

## Methods Implemented

### Regularized Regression Estimators
- **Ordinary Least Squares (OLS)** — baseline reference
- **Ridge Regression** — multiple biasing-parameter formulations:
  - Classical ridge parameter selection methods
  - Modern alternatives (Alkhamisi et al., 2006; Muniz et al., 2012; etc.)
- **Generalized Ridge Regression**
- **Lasso** — L₁ penalization for variable selection
- **Adaptive Lasso** — adaptive L₁ penalties based on initial estimates
- **SCAD (Smoothly Clipped Absolute Deviation)** — non-convex penalization
- **MCP (Minimax Concave Penalty)** — non-convex penalization

### Hybrid Ensemble Approaches
- Regularization–machine learning combinations
- Integration with:
  - Random Forests
  - Gradient Boosting
  - Support Vector Machines (SVM)

### Outcome Variables
- **Continuous**: Body Mass Index (BMI)
- **Binary**: Obesity status (obese vs. non-obese, WHO threshold BMI ≥ 30)

## Key References

### Original Dataset and Motivation
- Keller, P., Gburcik, V., Petrovic, N., et al. (2011). Gene-chip studies of adipogenesis-regulated microRNAs in mouse primary adipocytes and human obesity. *BMC Endocrine Disorders*, 11, 7. https://doi.org/10.1186/1472-6823-11-7

- World Health Organization. (2000). *Obesity: Preventing and managing the global epidemic*. WHO Technical Report Series, 894.

### Prior Bioinformatics Reanalysis
- Dong, Z., Lei, X., Kujawa, S. A., et al. (2021). Identification of core gene in obese type 2 diabetes patients using bioinformatics analysis. *Adipocyte*, 10(1), 310–321. https://doi.org/10.1080/21623945.2021.1933297

### Ridge Regression and Biasing Parameters
- Alkhamisi, M. A., Khalaf, G., & Shukur, G. (2006). Some modifications for choosing ridge parameters. *Communications in Statistics—Theory and Methods*, 35(11), 2005–2020.

- Kibria, B. M. G., & Lukman, A. F. (2020). A new ridge-type estimator for the linear regression model: Simulations and applications. *Scientifica*, 2020, Article 9758378. https://doi.org/10.1155/2020/9758378

- Lukman, A. F., & Ayinde, K. (2017). Review and classifications of the ridge parameter estimation techniques. *Hacettepe Journal of Mathematics and Statistics*, 46(5), 953–967.

- Muniz, G., Kibria, B. M. G., Månsson, K., & Shukur, G. (2012). On developing ridge regression parameters: A graphical investigation. *SORT—Statistics and Operations Research Transactions*, 36(2), 115–138.

- Dorugade, A. V. (2014). New ridge parameters for ridge regression. *Journal of the Association of Arab Universities for Basic and Applied Sciences*, 15, 94–99.

- Ayinde, K., Lukman, A. F., Samuel, O. O., & Ajiboye, S. (2018). Some new adjusted ridge estimators of linear regression model. *International Journal of Civil Engineering and Technology*, 9, 2838–2852.

### Non-Convex Penalization Methods
- Fan, J., & Li, R. (2001). Variable selection via nonconcave penalized likelihood and its oracle properties. *Journal of the American Statistical Association*, 96(456), 1348–1360.

- Zhang, C.-H. (2010). Nearly unbiased variable selection under minimax concave penalty. *The Annals of Statistics*, 38(2), 894–942.

## Repository Structure

```
Obesity-Prediction-from-High-Dimensional-Gene-Expression-Data/
├── README.md                          # This file
├── data/                              # GSE27951 expression data and phenotypes
├── scripts/                           # R analysis and modeling scripts
├── results/                           # Outputs, model comparisons, and visualizations
└── documentation/                     # Extended methods and supplementary materials
```

## Requirements

- **Language**: R
- **Key Packages**: (to be specified in scripts)
  - Regularization: `glmnet`, `ncvreg`, etc.
  - Machine Learning: `randomForest`, `gbm`, `e1071`, etc.
  - Data Handling: `dplyr`, `tidyr`, etc.
  - Visualization: `ggplot2`, `pheatmap`, etc.

## Usage

1. **Data Preparation**: Load GSE27951 human adipose tissue data
2. **Preprocessing**: Normalize gene expression, handle missing values
3. **Dimension Reduction**: Filter or select candidate genes (optional)
4. **Model Fitting**: Fit each regularized and hybrid estimator
5. **Evaluation**: Compare predictive performance and coefficient stability
6. **Visualization**: Generate diagnostic and comparative plots

## Key Findings and Contributions

This work:
- **Characterizes** performance of ridge, Lasso, SCAD, MCP, and hybrid approaches on real high-dimensional omics data
- **Addresses the p ≫ n regime** empirically rather than through simulation alone
- **Evaluates coefficient-level and prediction-level stability** under extreme multicollinearity
- **Benchmarks hybrid regularization–machine-learning ensembles** in high dimensions
- **Provides practical guidance** on regularized estimator selection for genomic prediction problems

## Author

Nayem-Stat

## License

[Specify your license, e.g., MIT, CC BY 4.0, etc.]

## Citation

If you use this dataset or analysis in your research, please cite both the original data source and this repository:

**Original Data**: Keller et al. (2011) – GSE27951, as deposited in the Gene Expression Omnibus (NCBI GEO).

**This Repository**: [Add repository-specific citation once published/versioned]

## Contact & Contributions

For questions, issues, or contributions, please open a GitHub issue or contact the repository maintainer.

---

*Last Updated*: October 2026  
*Data Source*: Gene Expression Omnibus (NCBI)  
*Platform*: Affymetrix Human Genome U133 Plus 2.0 array (GPL570)
