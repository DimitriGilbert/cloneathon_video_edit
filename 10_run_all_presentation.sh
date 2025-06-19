#!/bin/bash

# Master script for creating the presentation version
# Requires: clean_audio.mkv (from first pipeline) and soundtrack.mp3

echo "=================================================="
echo "LiteChat Entry Presentation Video Creation"
echo "=================================================="
echo ""

# Check prerequisites
echo "Checking prerequisites..."

if [ ! -f "clean_audio.mkv" ]; then
    echo "❌ Error: clean_audio.mkv not found!"
    echo "Please run the main pipeline first (00_run_all.sh)"
    exit 1
fi

if [ ! -f "soundtrack.mp3" ]; then
    echo "❌ Error: soundtrack.mp3 not found!"
    echo "Please place soundtrack.mp3 in the current directory"
    exit 1
fi

echo "✓ clean_audio.mkv found"
echo "✓ soundtrack.mp3 found"
echo ""

# Step 1: Create intro section
echo "Step 1/5: Creating normal-speed intro (first 10 seconds)..."
bash edit_script/11_create_speedup_intro.sh
if [ $? -ne 0 ]; then
    echo "❌ Error in step 1"
    exit 1
fi
echo ""

# Step 2: Calculate speed-up configuration
echo "Step 2/5: Calculating speed-up configuration..."
bash edit_script/12_get_soundtrack_duration.sh
if [ $? -ne 0 ]; then
    echo "❌ Error in step 2"
    exit 1
fi
echo ""

# Step 3: Create text overlay configuration
echo "Step 3/5: Setting up text overlays..."
bash edit_script/13_create_text_overlays.sh
if [ $? -ne 0 ]; then
    echo "❌ Error in step 3"
    exit 1
fi
echo ""

# Step 4: Create sped-up section with text and soundtrack
echo "Step 4/5: Creating sped-up section with text overlays and soundtrack..."
bash edit_script/14_create_speedup_section.sh
if [ $? -ne 0 ]; then
    echo "❌ Error in step 4"
    exit 1
fi
echo ""

# Step 5: Combine everything
echo "Step 5/5: Creating final presentation video..."
bash edit_script/15_combine_final_presentation.sh
if [ $? -ne 0 ]; then
    echo "❌ Error in step 5"
    exit 1
fi
echo ""

echo "=================================================="
echo "✅ Presentation pipeline complete!"
echo ""
echo "Generated files:"
echo "  - intro_normal.mkv (10s normal speed intro)"
echo "  - speedup_section.mkv (sped-up with text + soundtrack)"
echo "  - litechat_presentation.mkv (FINAL OUTPUT)"
echo "  - speedup_config.txt (configuration data)"
echo "  - text_overlays.txt (text timing data)"
echo ""
echo "🎬 Final video: litechat_presentation.mkv"
echo "   Structure: 10s normal intro + sped-up demo with text"
echo "==================================================" 