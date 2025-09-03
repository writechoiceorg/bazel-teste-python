import sys
import json

def parse_file(input_file, output_file):
    public_functions = []
    with open(input_file, "r") as f:
        for line in f:
            if line.strip().startswith("def ") and not line.strip().startswith("def _"):
                function_name = line.split(" ")[1].split("(")[0]
                public_functions.append(function_name)
    
    with open(output_file, "w") as f:
        json.dump(public_functions, f)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python parse_functions.py <input_file> <output_file>")
        sys.exit(1)
    
    parse_file(sys.argv[1], sys.argv[2])
