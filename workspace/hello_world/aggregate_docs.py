import sys
import json

def aggregate_docs(output_file, input_files):
    doc_content = "# Documentação do Projeto\n\n"
    
    for f_path in input_files:
        with open(f_path, "r") as json_file:
            functions = json.load(json_file)
            if functions:
                # Extrai o nome do arquivo original
                original_file = f_path.split("/")[-1].replace(".json", "")
                doc_content += "## Funções em `%s`\n\n" % original_file
                for func in functions:
                    doc_content += "- `%s()`\n" % func
    
    with open(output_file, "w") as f:
        f.write(doc_content)

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python aggregate_docs.py <output_file> <input_file1> <input_file2> ...")
        sys.exit(1)
        
    output_file = sys.argv[1]
    input_files = sys.argv[2:]
    aggregate_docs(output_file, input_files)
