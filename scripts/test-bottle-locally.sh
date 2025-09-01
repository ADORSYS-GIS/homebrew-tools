#!/bin/bash
# Script to test bottle building locally before pushing to GitHub

set -e

FORMULA=${1:-}

if [ -z "$FORMULA" ]; then
  echo "Usage: $0 <formula-name>"
  echo "Example: $0 suricata@7.0.10"
  exit 1
fi

echo "🔨 Building bottle for $FORMULA..."

# Ensure the tap is added
REPO_PATH=$(pwd)
TAP_NAME=$(basename $(dirname "$REPO_PATH"))/$(basename "$REPO_PATH")

echo "Adding local tap..."
brew tap-new "$TAP_NAME" || true
brew tap "$TAP_NAME" "$REPO_PATH" --force

# Install dependencies
echo "Installing dependencies..."
brew install --only-dependencies "$FORMULA"

# Build with bottle flag
echo "Building formula with bottle flag..."
brew install --build-bottle "$FORMULA"

# Create bottle
echo "Creating bottle..."
brew bottle --json --root-url="https://github.com/$TAP_NAME/releases/download/bottles" "$FORMULA"

# Display results
echo ""
echo "✅ Bottle created successfully!"
echo ""
echo "Generated files:"
ls -la *.bottle.* *.json 2>/dev/null || echo "No bottle files found"

echo ""
echo "Bottle DSL block to add to your formula:"
echo "----------------------------------------"

if [ -f "${FORMULA}--*.json" ]; then
  python3 -c "
import json
import glob

json_files = glob.glob('${FORMULA}--*.json')
if json_files:
    with open(json_files[0], 'r') as f:
        data = json.load(f)
        
    print('  bottle do')
    print('    root_url \"https://github.com/$TAP_NAME/releases/download/bottles\"')
    
    for formula in data.values():
        if 'bottle' in formula:
            for tag, info in formula['bottle']['tags'].items():
                cellar = info.get('cellar', ':any')
                sha256 = info.get('sha256', '')
                if cellar == ':any':
                    print(f'    sha256 cellar: :any, {tag}: \"{sha256}\"')
                elif cellar == ':any_skip_relocation':
                    print(f'    sha256 cellar: :any_skip_relocation, {tag}: \"{sha256}\"')
                else:
                    print(f'    sha256 {tag}: \"{sha256}\"')
    print('  end')
  "
fi

echo ""
echo "To test the bottle locally:"
echo "1. Move the .bottle.tar.gz file to: $(brew --cache)"
echo "2. Uninstall the formula: brew uninstall $FORMULA"
echo "3. Reinstall from bottle: brew install $FORMULA"