#!/usr/bin/env python3
"""Generate bottle DSL blocks from JSON files"""

import json
import sys

def generate_bottle_block(json_file, root_url):
    """Generate a bottle DSL block from a JSON file"""
    
    with open(json_file, 'r') as f:
        data = json.load(f)
    
    output = []
    output.append("bottle do")
    output.append(f'  root_url "{root_url}"')
    
    for formula in data.values():
        if 'bottle' in formula:
            for tag, info in formula['bottle']['tags'].items():
                cellar = info.get('cellar', ':any')
                sha256 = info.get('sha256', '')
                
                if cellar == ':any':
                    output.append(f'  sha256 cellar: :any, {tag}: "{sha256}"')
                elif cellar == ':any_skip_relocation':
                    output.append(f'  sha256 cellar: :any_skip_relocation, {tag}: "{sha256}"')
                else:
                    output.append(f'  sha256 {tag}: "{sha256}"')
    
    output.append("end")
    return "\n".join(output)

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: generate-bottle-blocks.py <json-file> <root-url>")
        sys.exit(1)
    
    json_file = sys.argv[1]
    root_url = sys.argv[2]
    
    try:
        block = generate_bottle_block(json_file, root_url)
        print(block)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)