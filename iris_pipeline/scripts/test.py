import os

# Check the current working directory
print("Current working directory:", os.getcwd())

# Try writing a file
file_path = "output.txt"
try:
    with open(file_path, "w") as f:
        f.write("Hello, world!")
    print(f"File written successfully to {file_path}")
except Exception as e:
    print(f"Error writing file: {e}")