import sys
import pandas as pd
import os

def slice_file(input_file, rows_per_file=50):
    
    # Load the file into a Pandas DataFrame
    data = pd.read_csv(input_file)
    
    # Slice the file into chunks of `rows_per_file`
    for i, start_row in enumerate(range(0, len(data), rows_per_file)):
        chunk = data[start_row:start_row + rows_per_file]
        chunk_file = os.path.join(f"slice_{i + 1}.csv")
        chunk.to_csv(chunk_file, index=False)
        print(f"Saved {chunk_file}")

if __name__ == "__main__":
    # Check command-line arguments
    if len(sys.argv) != 2:
        print("Usage: python slice_file.py <input_file>")
        sys.exit(1)

    input_file = sys.argv[1]

    slice_file(input_file)