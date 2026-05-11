#!/bin/bash
mkdir -p citibike_2025
cd citibike_2025

# Try each month of 2025. Some later ones may 404 if not published yet.
for month in 01 02 03 04 05 06 07 08 09 10 11 12; do
    filename="2025${month}-citibike-tripdata.zip"
    url="https://s3.amazonaws.com/tripdata/${filename}"
    echo "Downloading ${filename}..."
    wget -q --show-progress "$url" || echo "  (not available, skipping)"
done

# Unzip everything
for f in *.zip; do
    [ -e "$f" ] || continue
    unzip -o "$f"
done

# Clean up zips if you want
# rm *.zip