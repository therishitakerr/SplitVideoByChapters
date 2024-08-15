#!/bin/bash

# Extract file extension and base name
file="$1"
ext="${file##*.}"
basename="${file%.*}"

# Extract chapters information
ffprobe -show_chapters "$file" | grep -E 'id=|start_time=|end_time=|title=' > chapters.txt

# Read chapters file and process each chapter
while IFS= read -r chapter_id && IFS= read -r start_time && IFS= read -r end_time && IFS= read -r chapter_title; do
    id="${chapter_id#*=}"
    st="${start_time#*=}"
    en="${end_time#*=}"
    title="${chapter_title#*=}"
    
    # Sanitize title to remove problematic characters
    sanitized_title=$(echo "$title" | tr -d '[:/:*?"<>|]')
    
    # Extract chapter using ffmpeg
    ffmpeg -nostdin -ss "$st" -to "$en" -y -i "$file" -c copy "${basename}-${id}-${sanitized_title}.${ext}"
done < chapters.txt

# Clean up
rm chapters.txt
