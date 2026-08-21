import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score,confusion_matrix
# Load the Datasets
uci_diabetes = pd.read_csv("uci_diabetes.csv")
pima_diabetes = pd.read_csv("pima_diabetes.csv")
# Select Features and Target Variable
features = ["Glucose", "BloodPressure", "BMI"]
target = "Outcome" # Target variable indicating diabetes presence
X_uci = uci_diabetes[features]
y_uci = uci_diabetes[target]
X_pima = pima_diabetes[features]
y_pima = pima_diabetes[target]
# Split Data into Training and Testing Sets (80%-20%)
X_train_uci, X_test_uci, y_train_uci, y_test_uci = train_test_split(X_uci, y_uci, test_size=0.2,
random_state=42)

X_train_pima, X_test_pima, y_train_pima, y_test_pima = train_test_split(X_pima, y_pima,
test_size=0.2, random_state=42)
# Train the Logistic Regression Model
model_uci = LogisticRegression()
model_uci.fit(X_train_uci, y_train_uci)

model_pima = LogisticRegression()
model_pima.fit(X_train_pima, y_train_pima)
# Make Predictions
y_pred_uci = model_uci.predict(X_test_uci)y_pred_pima = model_pima.predict(X_test_pima)
