#!/usr/bin/env bash
# Create an indexed array
indexed_array=(bottle cup apple orange)

# iterate over the array to print each element
for el in "${indexed_array[@]}"; do 
	echo "$el";
done

# Create an associative array
declare -A associative_array
associative_array=([name]="John Doe" [age]=30 [city]="New York")

# iterate over the associative array to print each key-value pair
for key in "${!associative_array[@]}"; do 
	echo "$key: ${associative_array[$key]}";
done
