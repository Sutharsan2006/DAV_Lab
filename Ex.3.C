#3.C
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import r2_score

# Load the Datasets
uci_diabetes = pd.read_csv("uci_diabetes.csv")
pima_diabetes = pd.read_csv("pima_diabetes.csv")

# Select Relevant Features and Target Variable
features = ["Glucose", "BloodPressure", "Age"]
target = "BMI"

# Define Function for Multiple Regression Analysis
def multiple_regression_analysis(df, dataset_name):
    # Remove missing values (important)
    df = df.dropna()

    # Extract Features and Target Variable
    X = df[features]
    y = df[target]

    # Split Data into Training and Testing Sets
    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=0.2, random_state=42
    )

    # Initialize and Train the Model
    model = LinearRegression()
    model.fit(X_train, y_train)

    # Predict and Evaluate the Model
    y_pred = model.predict(X_test)
    r2 = r2_score(y_test, y_pred)

    # Print R² Score (FIXED INDENTATION)
    print(f"\n{dataset_name} - Multiple Regression R² Score: {r2:.4f}")

# Perform Multiple Regression on Both Datasets
multiple_regression_analysis(uci_diabetes, "UCI Diabetes Dataset")
multiple_regression_analysis(pima_diabetes, "Pima Indians Diabetes Dataset")

O/P:

UCI Diabetes Dataset - Multiple Regression R² Score: -0.4509

Pima Indians Diabetes Dataset - Multiple Regression R² Score: -0.0930
