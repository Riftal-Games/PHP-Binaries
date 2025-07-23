#!/bin/bash

# Script to comment out android, windows, and macOS x86_64 from the workflow

workflow_file=".github/workflows/main-pm-matrix.yml"

# Create a backup
cp "$workflow_file" "$workflow_file.backup"

# Use sed to comment out the sections
# 1. Comment out android job (lines 27-110)
sed -i '' '27,110s/^/  # /' "$workflow_file"

# 2. Comment out windows job (lines 233-272)
sed -i '' '233,272s/^/  # /' "$workflow_file"

# 3. Comment out macOS x86_64 matrix entry (lines 173-175)
sed -i '' '173,175s/^/          # /' "$workflow_file"

# 4. Update publish job dependencies
sed -i '' 's/needs: \[linux, macos, windows, android\]/needs: [linux, macos]/' "$workflow_file"

echo "Successfully commented out android, windows, and macOS x86_64 builds"