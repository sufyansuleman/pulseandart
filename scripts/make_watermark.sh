#!/bin/bash

# Pulse and Art - Create Watermark
# Creates watermark for clickable images (1200x1200)
# Output folder: raw_processed_images/images_card_clickable

output_folder="./raw_processed_images/images_card_clickable"
watermark_image="$output_folder/watermark_clickable.png"
magick="/c/Program Files/ImageMagick-7.1.2-Q16-HDRI/magick.exe"

# Create output folder if needed
mkdir -p "$output_folder"

echo "Creating watermark..."

"$magick" -size 1200x1200 xc:none -font Arial -pointsize 90 -fill "rgba(255, 255, 255, 0.2)" \
    -gravity north -annotate +0+150 "Pulse and Art" \
    -gravity center -annotate +0+0 "Pulse and Art" \
    -gravity south -annotate +0+150 "Pulse and Art" \
    "$watermark_image"

echo "Watermark created: $watermark_image"
