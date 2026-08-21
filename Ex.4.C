#4.C

import pandas as pd
import numpy as np
from scipy.stats import ttest_ind

uci_diabetes = pd.read_csv("uci_diabetes.csv")
pima_diabetes = pd.read_csv("pima_diabetes.csv")
numerical_columns = ["Glucose", "BloodPressure", "BMI"]

t_test_results = {}
for col in numerical_columns:
 t_stat, p_value = ttest_ind(uci_diabetes[col], pima_diabetes[col], equal_var=False)
 t_test_results[col] = {"T-statistic": t_stat, "P-value": p_value}

t_test_df = pd.DataFrame(t_test_results).T
# Display Results
print("\nT-test Results:\n", t_test_df)

O/P:

T-test Results:
                T-statistic   P-value
Glucose          -0.399652  0.689844
BloodPressure     1.399326  0.163284
BMI               0.340068  0.734168
