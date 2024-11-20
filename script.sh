#!/bin/bash
source_dir="../gcdf-geospatial-data-3.0.1/latest/geojsons"
dest_dir="./data"

ids_file="./ids.txt"

# Iterate over each ID
while read -r id; do
  # Trim whitespace from ID
  id=$(echo "$id" | xargs)

  # Skip empty lines
  [[ -z "$id" ]] && continue

  # Debug: Output current ID
  echo "Processing ID: $id"

  # Find the file matching the ID
  file=$(find "$source_dir" -type f -name "*$id*.geojson")

  # Debug: Output the file path found
  echo "Found file: $file"

  # Check if the file exists
  if [ -f "$file" ]; then
    # Copy the file to the destination directory
    cp "$file" "$dest_dir"
    echo "Copied $file to $dest_dir"
  else
    echo "File with ID $id not found."
  fi
done < "$ids_file"