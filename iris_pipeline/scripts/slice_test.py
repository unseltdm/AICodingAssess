import pandas as pd
import sys

def split_iris_data(input_file, group1, group2, group3, chunksize=1000):
    """Splits the dataset into three groups and writes the groups to separate files in chunks."""
    group1_writer = open(group1, 'w')
    group2_writer = open(group2, 'w')
    group3_writer = open(group3, 'w')

    header_written = False

    for chunk in pd.read_csv(input_file, chunksize=chunksize):
        df_group1 = chunk[chunk['SepalWidthCm'] < 3.0]
        df_group2 = chunk[(chunk['SepalWidthCm'] >= 3.0) & (chunk['SepalWidthCm'] < 3.5)]
        df_group3 = chunk[chunk['SepalWidthCm'] >= 3.5]

        if not header_written:
            df_group1.to_csv(group1_writer, index=False, mode='a')
            df_group2.to_csv(group2_writer, index=False, mode='a')
            df_group3.to_csv(group3_writer, index=False, mode='a')
            header_written = True
        else:
            df_group1.to_csv(group1_writer, index=False, mode='a', header=False)
            df_group2.to_csv(group2_writer, index=False, mode='a', header=False)
            df_group3.to_csv(group3_writer, index=False, mode='a', header=False)

    group1_writer.close()
    group2_writer.close()
    group3_writer.close()

if __name__ == "__main__":
    input_file = sys.argv[1]
    group1 = sys.argv[2]
    group2 = sys.argv[3]
    group3 = sys.argv[4]
    split_iris_data(input_file, group1, group2, group3)