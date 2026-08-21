#4.D

import pandas as pd
import numpy as np
from scipy.stats import f_oneway

uci_diabetes = pd.read_csv("uci_diabetes.csv")
pima_diabetes = pd.read_csv("pima_diabetes.csv")

numerical_columns = ["Glucose", "BloodPressure", "BMI"]

anova_results = {}
for col in numerical_columns:
 f_stat, p_value = f_oneway(uci_diabetes[col], pima_diabetes[col])
 anova_results[col] = {"F-statistic": f_stat, "P-value": p_value}

anova_df = pd.DataFrame(anova_results).T
print("\nANOVA Results:\n", anova_df)

O/P:
ANOVA Results:
                F-statistic   P-value
Glucose           0.159722  0.689843
BloodPressure     1.958114  0.163280
BMI               0.115646  0.734166
