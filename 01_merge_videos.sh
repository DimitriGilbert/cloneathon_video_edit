#!/bin/bash

# Script to merge all MKV files into a single raw.mkv
# Based on the examples in bash_history

echo "Creating file list for concatenation..."

# Create temporary file list for concat
cat > filelist.txt << EOF
file '2025-06-19 18-07-05.mkv'
file '2025-06-19 18-48-15.mkv'
file '2025-06-19 18-53-22.mkv'
file '2025-06-19 18-55-51.mkv'
file '2025-06-19 18-57-30.mkv'
EOF

echo "Merging MKV files into raw.mkv..."

# Use concat demuxer to merge files (based on bash_history example)
ffmpeg -f concat -safe 0 -i filelist.txt -c copy raw.mkv

echo "Cleaning up temporary files..."
rm filelist.txt

echo "✓ Merge complete: raw.mkv created" 