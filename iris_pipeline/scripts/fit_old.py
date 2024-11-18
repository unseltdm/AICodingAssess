from sklearn.linear_model import LinearRegression
import pandas as pd

# Fit a linear regression model on each group
models = []
for name, group in groups:
    X = group.drop(['Species','splice'], axis=1)
    y = group['Species']
    model = LinearRegression()
    model.fit(X, y)
    models.append(model)