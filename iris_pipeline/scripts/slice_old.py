import pandas as pd

# Load the iris dataset
df = pd.read_csv("/input/Iris.csv", sep=',')

df_group1 = df[df['SepalWidthCm'] < 3.0]
df_group2 = df[(df['SepalWidthCm'] >= 3.0) & (df['SepalWidthCm'] < 3.5)]
df_group3 = df[df['SepalWidthCm'] >= 3.5]

# Write the subset datasets to separate output files
df_group1.to_csv('/output/group1.csv', index=False)
df_group2.to_csv('/output/group2.csv', index=False)
df_group3.to_csv('/output/group3.csv', index=False)