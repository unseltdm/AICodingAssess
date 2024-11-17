from sklearn.linear_model import LinearRegression
import pandas as pd

# Set the display options for the dataframe
pd.set_option('display.max_columns', None)
pd.set_option('display.max_rows', None)

# Load the iris dataset
df = pd.read_csv("/input/Iris.csv", sep=',')

# Define a function to assign group based on sepal width
def assign_group(sepal_width):
    if sepal_width < 3:
        return '0'
    elif sepal_width >= 3 and sepal_width < 3.5:
        return '1'
    else:
        return '2'

# Create a new column containing the group based on sepal width
df['splice'] = df['SepalWidthCm'].apply(assign_group)

# Group the data by target variable
groups = df.groupby('splice')

# Fit a linear regression model on each group
models = []
for name, group in groups:
    X = group.drop(['Species','splice'], axis=1)
    y = group['Species']
    model = LinearRegression()
    model.fit(X, y)
    models.append(model)

# Combine the models into a single table
model_table = pd.DataFrame(columns=df.columns[0:4], index=[0,1,2])
for i, model in enumerate(models):
    model_table.iloc[i] = model.coef_

model_table.to_csv('/output/model_output.csv', index=False)