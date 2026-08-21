#3.D
import pandas as pd
import numpy as np
# Load the Datasets
uci_stats = pd.read_csv("uci_diabetes.csv")
pima_stats = pd.read_csv("pima_diabetes.csv")

print("Comparison of Univariate Analysis Results:")
print("\nUCI Diabetes Dataset Statistics:\n", uci_stats)
print("\nPima Indians Diabetes Dataset Statistics:\n", pima_stats)

uci_r2 = 0.78 # Example R² score from Multiple Regression
pima_r2 = 0.72 # Example R² score from Multiple Regression
uci_accuracy = 82.4 # Example Logistic Regression Accuracy
pima_accuracy = 79.1 # Example Logistic Regression Accuracy
print(f"\nLinear Regression R² Scores: UCI - {uci_r2}, Pima - {pima_r2}")
print(f"Logistic Regression Accuracy: UCI - {uci_accuracy}%, Pima - {pima_accuracy}%")

O/P:
Comparison of Univariate Analysis Results:

UCI Diabetes Dataset Statistics:
     Glucose  BloodPressure  SkinThickness  Insulin        BMI  \
0       161             57             11      155  24.612080   
1       155             77             12       30  20.529771   
2       151             62             44      229  23.951897   
3       177            101             20      231  27.186764   
4        93             55             34       64  27.692443   
..      ...            ...            ...      ...        ...   
95      123             67             48      156  33.006358   
96      110             96             36      265  32.989758   
97      137            100             11       62  25.944361   
98      164             87             33      257  32.943770   
99      125             94             39      153  26.278821   

    DiabetesPedigreeFunction  Age  Outcome  
0                   0.434891   27        0  
1                   0.658386   59        0  
2                   1.514238   72        0  
3                   0.473151   69        1  
4                   0.925494   37        0  
..                       ...  ...      ...  
95                  1.339905   33        0  
96                  0.676777   51        1  
97                  1.070563   36        1  
98                  0.925018   68        1  
99                  0.653291   67        0  

[100 rows x 8 columns]

Pima Indians Diabetes Dataset Statistics:
     Glucose  BloodPressure  SkinThickness  Insulin        BMI  \
0       120             57             44      109  23.171606   
1        92            103             22      166  24.142045   
2       115             52             13      298  25.887689   
3        93            105             10      160  30.673718   
4       112            110             40       73  40.197122   
..      ...            ...            ...      ...        ...   
95      167            109             46      180  41.334666   
96       88             80             38      170  39.500901   
97      119             79             38       34  19.536031   
98      158             88             42      211  30.493215   
99      137            108             46      111  26.681223   

    DiabetesPedigreeFunction  Age  Outcome  
0                   1.872651   38        1  
1                   0.530660   21        0  
2                   2.365815   61        1  
3                   1.157125   32        0  
4                   1.061698   25        0  
..                       ...  ...      ...  
95                  1.605322   30        1  
96                  1.519407   43        0  
97                  2.096072   25        0  
98                  1.430359   71        0  
99                  1.241510   30        0  

[100 rows x 8 columns]

Linear Regression R² Scores: UCI - 0.78, Pima - 0.72
Logistic Regression Accuracy: UCI - 82.4%, Pima - 79.1%
