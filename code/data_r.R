# Data Loading and Exploration Script
# =====================================
# Load GSE27951 high-dimensional gene expression dataset
# For obesity prediction from adipose tissue microarray data

# Clear environment
rm(list = ls())

# Set working directory (adjust as needed)
# setwd("path/to/project")

# ============================================
# 1. LOAD DATA
# ============================================

# Load the pre-processed, high-dimensional gene expression matrix
# Dimensions: 33 samples × 54,675 gene expression probe sets
data <- readRDS("data/GSE27951_full_highdim.rds")

# Check dimensions
dim(data)
# Expected output: 33 54675

# ============================================
# 2. BASIC EXPLORATION
# ============================================

# View data structure
str(data, max.level = 2)

# Display first few rows and columns
head(data[, 1:10])

# Check data class
class(data)

# ============================================
# 3. SUMMARY STATISTICS
# ============================================

# Summary across all features (genes)
# This may take a moment for ~54K features
summary(data)

# Distribution of expression values
cat("\nExpression value statistics:\n")
cat("Min:", min(data), "\n")
cat("Max:", max(data), "\n")
cat("Mean:", mean(as.matrix(data)), "\n")
cat("Median:", median(as.matrix(data)), "\n")

# ============================================
# 4. MISSING DATA CHECK
# ============================================

# Check for missing values
missing_count <- sum(is.na(data))
cat("Total missing values:", missing_count, "\n")
cat("Percentage missing:", 100 * missing_count / prod(dim(data)), "%\n")

# ============================================
# 5. SAMPLE-LEVEL EXPLORATION
# ============================================

# Number of samples
n_samples <- nrow(data)
cat("\nNumber of samples:", n_samples, "\n")

# Number of genes (probe sets)
n_genes <- ncol(data)
cat("Number of genes:", n_genes, "\n")

# Dimensionality: p >> n
cat("\nHigh-dimensional regime: p >> n\n")
cat("p (genes) =", n_genes, "\n")
cat("n (samples) =", n_samples, "\n")
cat("Ratio p/n =", n_genes / n_samples, "\n")

# ============================================
# 6. FEATURE VARIANCE ANALYSIS
# ============================================

# Calculate variance for each gene
gene_variance <- apply(data, 2, var)

# Summary of gene variances
cat("\nGene variance statistics:\n")
print(summary(gene_variance))

# Visualize variance distribution (optional)
# hist(gene_variance, breaks = 50, main = "Distribution of Gene Variances",
#      xlab = "Variance", ylab = "Frequency")

# Identify low-variance genes (candidates for filtering)
low_var_threshold <- quantile(gene_variance, 0.1)
low_var_genes <- which(gene_variance < low_var_threshold)
cat("\nLow-variance genes (bottom 10%):", length(low_var_genes), "\n")

# ============================================
# 7. SAMPLE CORRELATION & PCA
# ============================================

# Transpose for sample-level analysis
data_t <- t(data)  # Genes × Samples

# Compute sample correlation matrix
sample_cor <- cor(data_t)

# Quick PCA (optional - on full data, can be slow)
# pca_result <- prcomp(data, center = TRUE, scale. = TRUE)
# plot(pca_result$x[, 1:2], main = "PCA of samples")

cat("\nDataset loaded successfully!\n")
cat("Ready for preprocessing and modeling.\n")

# ============================================
# 8. SAVE PROCESSED DATA (Optional)
# ============================================

# If you apply preprocessing here, save results:
# saveRDS(data_preprocessed, "data/GSE27951_preprocessed.rds")
