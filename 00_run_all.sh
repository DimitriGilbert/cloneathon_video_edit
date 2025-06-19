#!/bin/bash

# Master script to run all video processing steps
# Processes litechat_entry MKV files through complete pipeline

echo "=========================================="
echo "LiteChat Entry Video Processing Pipeline"
echo "=========================================="
echo ""

# Check if all required MKV files exist
files=(
    "2025-06-19 18-07-05.mkv"
    "2025-06-19 18-48-15.mkv" 
    "2025-06-19 18-53-22.mkv"
    "2025-06-19 18-55-51.mkv"
    "2025-06-19 18-57-30.mkv"
)

echo "Checking for input files..."
for file in "${files[@]}"; do
    if [ ! -f "$file" ]; then
        echo "❌ Error: $file not found!"
        exit 1
    else
        echo "✓ Found: $file"
    fi
done
echo ""

# Step 1: Merge videos
echo "Step 1/4: Merging MKV files..."
bash edit_script/01_merge_videos.sh
if [ $? -ne 0 ]; then
    echo "❌ Error in step 1"
    exit 1
fi
echo ""

# Step 2: Extract audio
echo "Step 2/4: Extracting audio..."
bash edit_script/02_extract_audio.sh
if [ $? -ne 0 ]; then
    echo "❌ Error in step 2"
    exit 1
fi
echo ""

# Step 3: Enhance audio
echo "Step 3/4: Enhancing audio..."
bash edit_script/03_enhance_audio.sh
if [ $? -ne 0 ]; then
    echo "❌ Error in step 3"
    exit 1
fi
echo ""

# Step 4: Replace audio
echo "Step 4/4: Creating final video with enhanced audio..."
bash edit_script/04_replace_audio.sh
if [ $? -ne 0 ]; then
    echo "❌ Error in step 4"
    exit 1
fi
echo ""

echo "=========================================="
echo "✅ Pipeline complete!"
echo ""
echo "Output files created:"
echo "  - raw.mkv (merged video)"
echo "  - raw.aac (extracted audio)"
echo "  - clean.mp3 (enhanced audio)"
echo "  - clean_audio.mkv (final video with enhanced audio)"
echo "==========================================" 