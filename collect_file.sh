#!/bin/bash
input_dir="$1"
output_dir="$2"
mkdir "$output_dir"
find "$input_dir" -type f -exec cp {} "$output_dir" \;
