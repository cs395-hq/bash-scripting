#!/usr/bin/env bash

# Loop over the target files
for file in *.sh; do
    # Extract the number from the beginning of the filename
    old_number=$(echo "$file" | grep -o '^[0-9]\+')

    # Remove leading zeros for comparison
    stripped_number=$(echo "$old_number" | sed 's/^0*//')

    # Check if we found a valid number and if the number is >= 6
    if [[ -n "$stripped_number" && "$stripped_number" -ge 6 ]]; then
        # Decrease the number by 1
        new_number=$(printf "%02d" $((stripped_number - 1)))

        # Generate the new filename by replacing the old number with the new one
        new_filename=$(echo "$file" | sed "s/^$old_number/$new_number/")

        # Rename the file
        mv "$file" "$new_filename"
        echo "Renamed: $file -> $new_filename"
    else
        echo "Skipping: $file (number is less than 06 or invalid)"
    fi
done
