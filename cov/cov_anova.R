#! /usr/local/bin/R

# library
library(ggplot2)
library(readxl)
library(car)

justdups <- read_excel("/Users/tpd0001/github/sandbox/cov/sr_meancov.for_R.just_dups.xlsx")
justdups$threshold <- factor(justdups$threshold)
res.aov <- aov(mean_cov ~ threshold, data = justdups)
#summary(res.aov)

#                 Df    Sum Sq Mean Sq F value Pr(>F)
# threshold       15     52728    3515   1.287    0.2
# Residuals   112062 306029240    2731               



#just_nondups <- read_excel("/Users/tpd0001/github/sandbox/cov/sr_meancov.for_R.just_nondups.xlsx")
#just_nondups$threshold <- factor(just_nondups$threshold)
#res.aov <- aov(mean_cov ~ threshold, data = just_nondups)
#summary(res.aov)

#                 Df    Sum Sq Mean Sq F value Pr(>F)    
# threshold       15 8.415e+06  560978   113.8 <2e-16 ***
# Residuals   230404 1.136e+09    4932                   
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
