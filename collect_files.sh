#!/bin/bash
input_dir="$1"
output_dir="$2"
mkdir -p "$output_dir"
maxdepth=""
if [ "$3" == "--max_depth" ] && [ -n "$4" ]; then
  maxdepth="-maxdepth $4"
fi
find "$input_dir" $maxdepth -type f | while read filepath; do
  filename=$(basename "$filepath")
  dest="$output_dir/$filename"
  if [ -e "$dest" ]; then
    base="${filename%.*}"
    ext="${filename##*.}"
    counter=1
    while [ -e "$output_dir/${base}_${counter}.${ext}" ]; do
      counter=$((counter + 1))
    done
    new_filename="${base}_${counter}.${ext}"
    cp "$filepath" "$output_dir/$new_filename"
  else
    cp "$filepath" "$dest"
  fi
done