import sys
import pandas as pd
from sklearn.linear_model import LinearRegression
import os

def run_linear_regression(input_file):
    # Load the data
    data = pd.read_csv(input_file)

    # Prepare the data
    X = data.drop(['Species'], axis=1)
    y = data['Species']

    # Perform linear regression
    model = LinearRegression()
    model.fit(X, y)

    # Save results
    result = {
        'slope': model.coef_[0],
        'intercept': model.intercept_,
        'r_squared': model.score(X, y)
    }

    # Write to output file
    # update to include basename
    pd.DataFrame([result]).to_csv('linear_regression_output.csv', index=False)
    print(f"Saved results to linear_regression_output.csv")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python fit.py <input_file>")
        sys.exit(1)

    input_file = sys.argv[1]

    run_linear_regression(input_file)