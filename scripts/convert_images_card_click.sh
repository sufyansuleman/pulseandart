#!/bin/bash

# Pulse and Art - Convert Images
# Resizes images to 300x300 (cards) and 1200x1200 with watermark (clickable)
# Input: raw_processed_images/images_raw/*.jpg
# Output: raw_processed_images/images_card_clickable/

input_folder="./raw_processed_images/images_raw"
output_folder="./raw_processed_images/images_card_clickable"
watermark="$output_folder/watermark_clickable.png"
magick="/c/Program Files/ImageMagick-7.1.2-Q16-HDRI/magick.exe"

# Create output folder if needed
mkdir -p "$output_folder"

echo "Converting card-size images (300x300)..."
counter=1
for file in "$input_folder"/*.jpg; do
    [ ! -f "$file" ] && continue
    echo "Processing $(basename $file)"
    "$magick" "$file" -resize 300x300 "$output_folder/card_${counter}.webp"
    counter=$((counter+1))
done

echo "Converting clickable-size images (1200x1200 with watermark)..."
counter=1
for file in "$input_folder"/*.jpg; do
    [ ! -f "$file" ] && continue
    echo "Processing $(basename $file)"
    "$magick" "$file" -resize 1200x1200 "$watermark" -gravity northwest -composite "$output_folder/clickable_${counter}.webp"
    counter=$((counter+1))
done

echo "Done! Images saved to: $output_folder"
