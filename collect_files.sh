#!/bin/bash
input_dir="$1"
output_dir="$2"
mkdir -p "$output_dir"
counter=1
for filepath in $(find "$input_dir" -type f); do
  filename=$(basename "$filepath")
  if [ -e "$output_dir/$filename" ]; then
    name="${filename%.*}"
    ext="${filename##*.}"
    if [ "$name" == "$ext" ]; then
      new_filename="${name}_${counter}"
    else
      new_filename="${name}_${counter}.${ext}"
    fi

    cp "$filepath" "$output_dir/$new_filename"
    counter=$((counter + 1))
  else
    cp "$filepath" "$output_dir/$filename"
  fi
done