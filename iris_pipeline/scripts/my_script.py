import sys

def count_lines(input_file):
    with open(input_file, 'r') as f:
        lines = f.readlines()
    return len(lines)

if __name__ == '__main__':
    input_file = sys.argv[1]  # Get the input file from command line arguments
    num_lines = count_lines(input_file)
    print(f"Number of lines in {input_file}: {num_lines}")