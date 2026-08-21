#2.D
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load dataset
df = pd.read_csv("marks1.csv")

# Display basic information
print("Basic Information:")
print(df.info())

# Summary statistics
print("\nSummary Statistics:")
print(df.describe())

# Display first 5 rows
print("\nFirst 5 Rows:")
print(df.head())

# Check missing values
print("\nMissing Values:")
print(df.isnull().sum())

# Histograms for marks
df[['Maths', 'Science', 'physics', 'English', 'Social']].hist(
    figsize=(10, 8),
    edgecolor='black'
)
plt.suptitle("Subject Marks Distribution")
plt.show()

# Boxplot of marks
plt.figure(figsize=(8,6))
sns.boxplot(data=df[['Maths', 'Science', 'physics', 'English', 'Social']])
plt.title("Marks Comparison")
plt.show()

# Pairplot
sns.pairplot(df[['Maths', 'Science', 'physics', 'English', 'Social']])
plt.show()

# Correlation Heatmap
plt.figure(figsize=(6,5))
sns.heatmap(
    df[['Maths', 'Science', 'physics', 'English', 'Social']].corr(),
    annot=True,
    cmap='coolwarm'
)
plt.title("Correlation Heatmap")
plt.show()


O/P:

Basic Information:
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 21 entries, 0 to 20
Data columns (total 7 columns):
 #   Column     Non-Null Count  Dtype 
---  ------     --------------  ----- 
 0   Roll. No.  21 non-null     object
 1   Name       21 non-null     object
 2   Maths      21 non-null     int64 
 3   Science    21 non-null     int64 
 4   physics    21 non-null     int64 
 5   English    21 non-null     int64 
 6   Social     21 non-null     int64 
dtypes: int64(5), object(2)
memory usage: 1.3+ KB
None

Summary Statistics:
           Maths    Science    physics    English     Social
count  21.000000  21.000000  21.000000  21.000000  21.000000
mean   77.476190  83.095238  84.857143  82.523810  82.238095
std    15.217158  10.544689   8.223659  10.576479  12.210261
min    48.000000  65.000000  69.000000  65.000000  58.000000
25%    63.000000  78.000000  79.000000  78.000000  78.000000
50%    79.000000  83.000000  86.000000  80.000000  80.000000
75%    89.000000  90.000000  89.000000  89.000000  94.000000
max    96.000000  98.000000  98.000000  98.000000  98.000000

First 5 Rows:
  Roll. No.              Name  Maths  Science  physics  English  Social
0  24CS0285    HARIPRASANTH T     64       65       75       65      78
1  24CS0382          Jesina J     85       89       88       89      80
2  24CS0397  K YUVAN SARAVANA     78       80       82       80      92
3  24CS0398    Kaartthikha SR     96       98       89       98      80
4  24CS0400       KALAIVANI S     87       88       87       88      75

Missing Values:
Roll. No.    0
Name         0
Maths        0
Science      0
physics      0
English      0
Social       0
dtype: int64



