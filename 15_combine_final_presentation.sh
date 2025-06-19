#!/bin/bash

# Script to combine HIGH QUALITY intro (normal speed) with HIGH QUALITY sped-up section
# Creates final presentation video using stream copy for maximum efficiency

echo "Combining HIGH QUALITY intro and sped-up sections for final presentation..."

# Check if required files exist
if [ ! -f "intro_normal.mkv" ]; then
    echo "❌ Error: intro_normal.mkv not found!"
    exit 1
fi

if [ ! -f "speedup_section.mkv" ]; then
    echo "❌ Error: speedup_section.mkv not found!"
    exit 1
fi

# Create file list for concatenation
cat > final_filelist.txt << EOF
file 'intro_normal.mkv'
file 'speedup_section.mkv'
EOF

echo "Concatenating HIGH QUALITY intro and sped-up sections..."

# Concatenate the two parts using stream copy (no re-encoding needed)
ffmpeg -f concat -safe 0 -i final_filelist.txt \
  -c copy \
  litechat_presentation.mkv

# Clean up
rm final_filelist.txt

# Get final video info
DURATION=$(ffprobe -v quiet -show_entries format=duration -of csv=p=0 litechat_presentation.mkv)
SIZE=$(du -h litechat_presentation.mkv | cut -f1)

echo "✓ HIGH QUALITY final presentation created: litechat_presentation.mkv"
echo "  Duration: $(printf "%.1f" $DURATION) seconds"
echo "  Size: $SIZE"
echo "  Method: Stream copy (no quality loss)"
echo ""
echo "Structure:"
echo "  0-10s: Normal speed intro (HIGH QUALITY)"
echo "  10s+: Sped-up with text overlays and soundtrack (HIGH QUALITY)" 