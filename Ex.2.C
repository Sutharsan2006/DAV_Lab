#2.C
import pandas as pd

# Read CSV file
text_df = pd.read_csv("marks1.csv")

# Display first 5 rows
print("Original Data:")
print(text_df.head())

# Check for missing values
print("\nMissing Values:")
print(text_df.isnull().sum())

# Handle missing values using Forward Fill
text_df.ffill(inplace=True)

# Display data after processing
print("\nProcessed Data:")
print(text_df.head())

# Save processed data
text_df.to_csv("processed_marks.csv", index=False)

print("\nProcessed file saved successfully as 'processed_marks.csv'")

