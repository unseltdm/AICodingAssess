import pandas as pd
import argparse

def split_iris_data(input_file):
    """Reads the Iris dataset, splits it into groups based on SepalWidthCm, and writes them to CSV files."""
    try:
        # Load the iris dataset
        df = pd.read_csv(input_file, sep=',')

        # Split the dataframe into 3 groups based on SepalWidthCm
        df_group1 = df[df['SepalWidthCm'] < 3.0]
        df_group2 = df[(df['SepalWidthCm'] >= 3.0) & (df['SepalWidthCm'] < 3.5)]
        df_group3 = df[df['SepalWidthCm'] >= 3.5]

        # Write the subset datasets to separate output files
        df_group1.to_csv('group1.csv', index=False)
        df_group2.to_csv('group2.csv', index=False)
        df_group3.to_csv('group3.csv', index=False)

        print(f"Data successfully split into groups")

    except Exception as e:
        print(f"Error: {e}")

def main():
    """Main function to parse command-line arguments and run the script."""
    parser = argparse.ArgumentParser(description="Split the Iris dataset based on SepalWidthCm.")
    parser.add_argument('input_file', type=str, help="Path to the input Iris dataset CSV file.")
    
    args = parser.parse_args()

    # Run the data splitting function
    split_iris_data(args.input_file)

if __name__ == '__main__':
    main()