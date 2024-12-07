#!/usr/bin/env python3

"""
# 20241207 Copilot & fekerr
This script reformats a markdown file to ensure each line is no longer than
80 columns. If only one filename is provided, or if the input and output
filenames are the same, the script creates a backup copy of the input file 
with a unique timestamp and then proceeds to reformat the content.

How it works:
1. The script accepts one or two command-line arguments:
   - input_file: The markdown file to be reformatted.
   - output_file (optional): The file to save the reformatted content.
     If not provided, the input_file is used as the output_file.
     
2. If only one filename is provided or the input and output filenames are 
   the same:
   - A backup of the input file is created with a unique timestamp.
   - The original input file is used for reformatting, and the content is 
     saved back to it.

3. The script uses the textwrap module to reformat the markdown content 
   ensuring each line is no longer than 80 columns.

Usage:
   ./reformat_md.py <input_file> [<output_file>]

Example:
   ./reformat_md.py README.md formatted_README.md

"""

import textwrap
import sys
import shutil
import datetime

def reformat_md_file(input_file, output_file, width=80):
    with open(input_file, 'r') as infile:
        content = infile.read()
    
    wrapped_content = "\n".join(textwrap.fill(line, width) if line.strip() else line for line in content.splitlines())
    
    with open(output_file, 'w') as outfile:
        outfile.write(wrapped_content + "\n")

if len(sys.argv) < 2 or len(sys.argv) > 3:
    print("Usage: ./reformat_md.py <input_file> [<output_file>]")
else:
    input_file = sys.argv[1]
    if len(sys.argv) == 2 or sys.argv[1] == sys.argv[2]:
        # Create a backup of the input file
        timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
        backup_file = f"{input_file}.backup_{timestamp}"
        shutil.copy2(input_file, backup_file)
        print(f"Backup created: {backup_file}")
        output_file = input_file
    else:
        output_file = sys.argv[2]

    reformat_md_file(input_file, output_file)
    print(f"Reformatted file saved as {output_file}")

