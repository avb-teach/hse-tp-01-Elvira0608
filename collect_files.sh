#!/bin/bash
input_dir="$1"
output_dir="$2"
max_deth=0
if [ "$3" == "--max_depth" ] && [ -n "$4" ]; then
    max_depth="$4"
fi
python3 collect_files.py "$input_dir" "$output_dir" "$max_depth"