#!/bin/bash

# URL of the data
URL="http://www.amfiindia.com/spages/NAVAll.txt"

# Output TSV file
OUTPUT_FILE="mutual_fund_data.tsv"

# Use curl to fetch data from the URL and filter for Scheme Name and Asset Value fields
curl -s "$URL" | awk -F ';' 'BEGIN {OFS="\t"} {print $3, $8}' > "$OUTPUT_FILE"

echo "Data has been extracted and saved to $OUTPUT_FILE"

#Regarding the question of whether this data should be stored in JSON, that depends on your specific use case and requirements. JSON is a structured data format and may be more suitable if you need to preserve the hierarchy and relationships of the data. If you have such requirements, you can modify the script to output the data in JSON format instead of TSV.
