#4.B
import pandas as pd
import numpy as np
from statsmodels.stats.weightstats import ztest

uci_diabetes = pd.read_csv("uci_diabetes.csv")
z_stat, p_value = ztest(uci_diabetes["Glucose"], value=100)

print(f"Z-Statistic: {z_stat:.4f}")
print(f"P-Value: {p_value:.4f}")
alpha = 0.05

if p_value < alpha:
    print("Reject the null hypothesis: The mean Glucose level is significantly different from 100.")
else:
    print("Fail to reject the null hypothesis: No significant difference in mean Glucose level.")


O/P:
Z-Statistic: 11.7733
P-Value: 0.0000
Reject the null hypothesis: The mean Glucose level is significantly different from 100.
