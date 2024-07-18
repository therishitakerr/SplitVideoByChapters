#!/bin/bash

ext=$(echo "$1" | awk -F '.' '{print $(NF)}')
file=$(basename "$1" ."$ext")

ffprobe -show_chapters "$1" | grep -i 'id=\|start_time\|end_time\|title' >chapters.txt
while read -r chapter_id; do
	read -r start_time
	read -r end_time
	read -r chapter_title
	id=$(echo "$chapter_id" | awk -F '=' '{print $(NF)}')
	st=$(echo "$start_time" | awk -F '=' '{print $(NF)}')
	en=$(echo "$end_time" | awk -F '=' '{print $(NF)}')
	title=$(echo "$chapter_title" | awk -F '=' '{print $(NF)}')
	ffmpeg -nostdin -ss "$st" -to "$en" -y -i "$1" -c copy "$file-$id-$title.$ext"
done <chapters.txt
rm chapters.txt
