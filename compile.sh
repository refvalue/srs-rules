#!/bin/bash

DIRS=("./ip" "./non-ip")

for dir in "${DIRS[@]}"; do
    if [ -d "$dir" ]; then
        for json_file in "$dir"/*.json; do
            [ -e "$json_file" ] || continue
            output_file="${json_file%.json}.srs"
            echo "Compiling $json_file to $output_file"
            sing-box rule-set compile "$json_file" --output "$output_file"
        done
    fi
done
