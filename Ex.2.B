#2.B
import pandas as pd

# Load dataset
df = pd.read_csv("marks1.csv")

# Display first and last 5 rows
print("First 5 rows:")
print(df.head())

print("\nLast 5 rows:")
print(df.tail())

# Display DataFrame information
print("\nDataFrame Info:")
df.info()

# Summary statistics
print("\nSummary Statistics:")
print(df.describe(include='all'))

# Fill missing values in numeric columns with their mean
numeric_cols = df.select_dtypes(include='number').columns
df[numeric_cols] = df[numeric_cols].fillna(df[numeric_cols].mean())

# Remove duplicate rows
df.drop_duplicates(inplace=True)

# Remove remaining missing values
df.dropna(inplace=True)

# Create a new column using the first numeric column
if len(numeric_cols) > 0:
    first_num_col = numeric_cols[0]
    df["new_column"] = df[first_num_col] * 2

    # Series operation
    series = df[first_num_col]
    print("\nSeries + 10:")
    print(series + 10)

    # Filter rows
    filtered_df = df[df[first_num_col] > df[first_num_col].mean()]
    print("\nFiltered DataFrame:")
    print(filtered_df)

    # Sort values
    sorted_df = df.sort_values(by=first_num_col, ascending=False)
    print("\nSorted DataFrame:")
    print(sorted_df)

    # Boolean masking
    masked_df = df[df[first_num_col] > df[first_num_col].median()]
    print("\nMasked DataFrame:")
    print(masked_df)

    # Statistics
    print("\nStatistics:")
    print("Sum:", df[first_num_col].sum())
    print("Mean:", df[first_num_col].mean())
    print("Standard Deviation:", df[first_num_col].std())

# Group by the first categorical column (if available)
cat_cols = df.select_dtypes(include=['object', 'category']).columns

if len(cat_cols) > 0 and len(numeric_cols) > 0:
    grouped = df.groupby(cat_cols[0])[numeric_cols[0]].mean()
    print("\nGrouped Mean:")
    print(grouped)

# Create a subset with the first two columns
if len(df.columns) >= 2:
    subset_df = df.iloc[:, :2]
    subset_df.to_csv("filtered_data.csv", index=False)
    print("\nSubset saved as 'filtered_data.csv'")

print("\nProcessing completed successfully.")

O/P:
First 5 rows:
  Roll. No.              Name  Maths  Science  physics  English  Social
0  24CS0285    HARIPRASANTH T     64       65       75       65      78
1  24CS0382          Jesina J     85       89       88       89      80
2  24CS0397  K YUVAN SARAVANA     78       80       82       80      92
3  24CS0398    Kaartthikha SR     96       98       89       98      80
4  24CS0400       KALAIVANI S     87       88       87       88      75

Last 5 rows:
    Roll. No.          Name  Maths  Science  physics  English  Social
16  24CS0423    KAVIYASRI S     68       78       79       78      68
17   24CS0425  A Kayalvizhi     78       80       82       80      78
18  24CS0427    Keerthana c     96       95       96       98      96
19   24CS0428   KEERTHANA D     95       96       98       98      95
20   24CS0430   KEERTHANA R     94       95       98       78      94

DataFrame Info:
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

Summary Statistics:
       Roll. No.            Name      Maths    Science    physics    English  \
count         21              21  21.000000  21.000000  21.000000  21.000000   
unique        21              21        NaN        NaN        NaN        NaN   
top     24CS0285  HARIPRASANTH T        NaN        NaN        NaN        NaN   
freq           1               1        NaN        NaN        NaN        NaN   
mean         NaN             NaN  77.476190  83.095238  84.857143  82.523810   
std          NaN             NaN  15.217158  10.544689   8.223659  10.576479   
min          NaN             NaN  48.000000  65.000000  69.000000  65.000000   
25%          NaN             NaN  63.000000  78.000000  79.000000  78.000000   
50%          NaN             NaN  79.000000  83.000000  86.000000  80.000000   
75%          NaN             NaN  89.000000  90.000000  89.000000  89.000000   
max          NaN             NaN  96.000000  98.000000  98.000000  98.000000   

           Social  
count   21.000000  
unique        NaN  
top           NaN  
freq          NaN  
mean    82.238095  
std     12.210261  
min     58.000000  
25%     78.000000  
50%     80.000000  
75%     94.000000  
max     98.000000  

Series + 10:
0      74
1      95
2      88
3     106
4      97
5      66
6      58
7     106
8      73
9      95
10     96
11     73
12     68
13     99
14     89
15     73
16     78
17     88
18    106
19    105
20    104
Name: Maths, dtype: int64

Filtered DataFrame:
    Roll. No.              Name  Maths  Science  physics  English  Social  \
1    24CS0382          Jesina J     85       89       88       89      80   
2    24CS0397  K YUVAN SARAVANA     78       80       82       80      92   
3    24CS0398    Kaartthikha SR     96       98       89       98      80   
4    24CS0400       KALAIVANI S     87       88       87       88      75   
7    24CS0403     KAMALESWARI S     96       98       95       98      96   
9    24CS0405     Kamesh Babu R     85       87       88       87      98   
10   24CS0406       KAMESHWAR A     86       88       89       88      86   
13   24CS0414    KATHIRAVAN S A     89       90       92       90      89   
14   24CS0419          Kaveri K     79       78       80       78      79   
17   24CS0425      A Kayalvizhi     78       80       82       80      78   
18  24CS0427        Keerthana c     96       95       96       98      96   
19   24CS0428       KEERTHANA D     95       96       98       98      95   
20   24CS0430       KEERTHANA R     94       95       98       78      94   

    new_column  
1          170  
2          156  
3          192  
4          174  
7          192  
9          170  
10         172  
13         178  
14         158  
17         156  
18         192  
19         190  
20         188  

Sorted DataFrame:
    Roll. No.              Name  Maths  Science  physics  English  Social  \
3    24CS0398    Kaartthikha SR     96       98       89       98      80   
18  24CS0427        Keerthana c     96       95       96       98      96   
7    24CS0403     KAMALESWARI S     96       98       95       98      96   
19   24CS0428       KEERTHANA D     95       96       98       98      95   
20   24CS0430       KEERTHANA R     94       95       98       78      94   
13   24CS0414    KATHIRAVAN S A     89       90       92       90      89   
4    24CS0400       KALAIVANI S     87       88       87       88      75   
10   24CS0406       KAMESHWAR A     86       88       89       88      86   
1    24CS0382          Jesina J     85       89       88       89      80   
9    24CS0405     Kamesh Babu R     85       87       88       87      98   
14   24CS0419          Kaveri K     79       78       80       78      79   
17   24CS0425      A Kayalvizhi     78       80       82       80      78   
2    24CS0397  K YUVAN SARAVANA     78       80       82       80      92   
16  24CS0423        KAVIYASRI S     68       78       79       78      68   
0    24CS0285    HARIPRASANTH T     64       65       75       65      78   
8    24CS0404        KAMALIKA M     63       73       76       73      98   
11   24CS0409      KANISHKA S P     63       83       78       83      63   
15   24CS0421    Kavin Chand SA     63       73       75       73      63   
12   24CS0412   Karthik Kumaran     58       78       80       78      58   
5    24CS0401        KAMALESH J     56       68       69       68      79   
6    24CS0402        KAMALESH M     48       65       86       65      82   

    new_column  
3          192  
18         192  
7          192  
19         190  
20         188  
13         178  
4          174  
10         172  
1          170  
9          170  
14         158  
17         156  
2          156  
16         136  
0          128  
8          126  
11         126  
15         126  
12         116  
5          112  
6           96  
