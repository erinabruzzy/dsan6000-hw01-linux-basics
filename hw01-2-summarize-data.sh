#!/bin/bash

# Define the output summary CSV file
OUTPUT="wikimedia_data_summary.csv"

# Write the header row
echo "filename,size,num_lines" > "$OUTPUT"

# Loop through each downloaded CSV file in the data/ directory
for file in data/*.csv; do
    # Guard against no matching files
    [ -e "$file" ] || continue

    # 1. Extract just the filename (no directory path)
    fname=$(basename "$file")

    # 2. Get file size in human-readable format (e.g., 25M)
    fsize=$(ls -lh "$file" | awk '{print $5}')

    # 3. Get total line count
    flines=$(wc -l < "$file")

    # Append row to output CSV
    echo "$fname,$fsize,$flines" >> "$OUTPUT"
done
