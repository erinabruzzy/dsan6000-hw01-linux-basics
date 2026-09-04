#!/bin/bash

# Define output CSV
OUTPUT="wikimedia_data_summary.csv"

# Write CSV header
echo "filename,size,num_lines" > "$OUTPUT"

# Loop through each .csv file in data/
for file in data/*.csv; do
    # Check if files exist to handle empty directory edge cases
    [ -e "$file" ] || continue

    # Extract filename without directory path
    fname=$(basename "$file")

    # Get human-readable size
    fsize=$(ls -lh "$file" | awk '{print $5}')

    # Get line count
    flines=$(wc -l < "$file")

    # Append row to CSV
    echo "$fname,$fsize,$flines" >> "$OUTPUT"
done
