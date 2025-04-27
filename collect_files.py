import os
import sys
import shutil
input_dir = sys.argv[1]
output_dir = sys.argv[2]
if len(sys.argv) > 3:
    max_depth = int(sys.argv[3])
else:
    max_depth = 0


def get_unique_filename(filename, output_dir):
    osnova, ras = os.path.splitext(filename)
    count = 1
    new_filename = filename
    while os.path.exists(os.path.join(output_dir, new_filename)):
        new_filename = f"{osnova}_{count}{ras}"
        count += 1

    return new_filename

def collect_files(input_dir, output_dir, max_depth):
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)
    for root, dirs, files in os.walk(input_dir):
        current_depth = root[len(input_dir):].count(os.sep)

        if max_depth != 0 and current_depth >= max_depth:
            continue

        for file in files:
            file_path = os.path.join(root, file)
            unique_filename = get_unique_filename(file, output_dir)
            shutil.copy(file_path, os.path.join(output_dir, unique_filename))


collect_files(input_dir, output_dir, max_depth)
