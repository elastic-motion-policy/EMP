#!/bin/bash
# Loop through all .mp4 files in the directory
for file in *.mp4; do
    echo "Processing $file..."
    # Convert the file using x265; adjust -crf as needed
    ffmpeg -i "$file" -c:v libx265 -preset slow -crf 28 -c:a copy "${file%.mp4}_temp.mp4" && \
    # If conversion is successful, replace the original file
    mv "${file%.mp4}_temp.mp4" "$file"
done