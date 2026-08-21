#3.B
import pandas as pd
import matplotlib.pyplot as plt

from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression, LogisticRegression
from sklearn.metrics import r2_score, accuracy_score

# --------------------------------------------------
# Load Breast Cancer Dataset
# --------------------------------------------------
data = load_breast_cancer(as_frame=True)

df = data.frame

# Rename target column
df.rename(columns={"target": "Outcome"}, inplace=True)

print("Dataset Sample:")
print(df.head())

# --------------------------------------------------
# Linear Regression
# Predict mean radius using mean texture
# --------------------------------------------------
def linear_regression_analysis(df, x_column, y_column):

    X = df[[x_column]]
    Y = df[y_column]

    model = LinearRegression()
    model.fit(X, Y)

    Y_pred = model.predict(X)

    r2 = r2_score(Y, Y_pred)

    print("\nLinear Regression")
    print(f"Predicting {y_column} using {x_column}")
    print("R² Score:", round(r2,4))

    plt.figure(figsize=(8,5))
    plt.scatter(X, Y)
    plt.plot(X, Y_pred)
    plt.xlabel(x_column)
    plt.ylabel(y_column)
    plt.title("Linear Regression")
    plt.show()

# --------------------------------------------------
# Logistic Regression
# --------------------------------------------------
def logistic_regression_analysis(df, features, target):

    X = df[features]
    Y = df[target]

    X_train, X_test, Y_train, Y_test = train_test_split(
        X,
        Y,
        test_size=0.2,
        random_state=42
    )

    model = LogisticRegression(max_iter=5000)

    model.fit(X_train, Y_train)

    Y_pred = model.predict(X_test)

    accuracy = accuracy_score(Y_test, Y_pred)

    print("\nLogistic Regression")
    print("Accuracy:", round(accuracy,4))

# --------------------------------------------------
# Run Linear Regression
# --------------------------------------------------
linear_regression_analysis(
    df,
    "mean texture",
    "mean radius"
)

# --------------------------------------------------
# Run Logistic Regression
# --------------------------------------------------
features = [
    "mean radius",
    "mean texture",
    "mean perimeter",
    "mean area"
]

target = "Outcome"

logistic_regression_analysis(
    df,
    features,
    target
)

O/P:

Dataset Sample:
   mean radius  mean texture  mean perimeter  mean area  mean smoothness  \
0        17.99         10.38          122.80     1001.0          0.11840   
1        20.57         17.77          132.90     1326.0          0.08474   
2        19.69         21.25          130.00     1203.0          0.10960   
3        11.42         20.38           77.58      386.1          0.14250   
4        20.29         14.34          135.10     1297.0          0.10030   

   mean compactness  mean concavity  mean concave points  mean symmetry  \
0           0.27760          0.3001              0.14710         0.2419   
1           0.07864          0.0869              0.07017         0.1812   
2           0.15990          0.1974              0.12790         0.2069   
3           0.28390          0.2414              0.10520         0.2597   
4           0.13280          0.1980              0.10430         0.1809   

   mean fractal dimension  ...  worst texture  worst perimeter  worst area  \
0                 0.07871  ...          17.33           184.60      2019.0   
1                 0.05667  ...          23.41           158.80      1956.0   
2                 0.05999  ...          25.53           152.50      1709.0   
3                 0.09744  ...          26.50            98.87       567.7   
4                 0.05883  ...          16.67           152.20      1575.0   

   worst smoothness  worst compactness  worst concavity  worst concave points  \
0            0.1622             0.6656           0.7119                0.2654   
1            0.1238             0.1866           0.2416                0.1860   
2            0.1444             0.4245           0.4504                0.2430   
3            0.2098             0.8663           0.6869                0.2575   
4            0.1374             0.2050           0.4000                0.1625   

   worst symmetry  worst fractal dimension  Outcome  
0          0.4601                  0.11890        0  
1          0.2750                  0.08902        0  
2          0.3613                  0.08758        0  
3          0.6638                  0.17300        0  
4          0.2364                  0.07678        0  

[5 rows x 31 columns]

Linear Regression
Predicting mean radius using mean texture
R² Score: 0.1048


Logistic Regression
Accuracy: 0.9298
