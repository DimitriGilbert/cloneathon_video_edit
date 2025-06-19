#!/bin/bash

# Script to get soundtrack duration and calculate speed-up ratio
# This determines how much to speed up the remaining video

echo "Getting soundtrack.mp3 duration..."

# Check if soundtrack.mp3 exists
if [ ! -f "soundtrack.mp3" ]; then
    echo "❌ Error: soundtrack.mp3 not found!"
    echo "Please place soundtrack.mp3 in the current directory"
    exit 1
fi

# Get duration of soundtrack.mp3 in seconds
SOUNDTRACK_DURATION=$(ffprobe -v quiet -show_entries format=duration -of csv=p=0 soundtrack.mp3)
echo "Soundtrack duration: ${SOUNDTRACK_DURATION} seconds"

# Get duration of clean_audio.mkv starting from 10 seconds
TOTAL_DURATION=$(ffprobe -v quiet -show_entries format=duration -of csv=p=0 clean_audio.mkv)
REMAINING_DURATION=$(echo "$TOTAL_DURATION - 10" | bc -l)
echo "Video remaining duration (after 10s intro): ${REMAINING_DURATION} seconds"

# Calculate speed-up ratio
SPEED_RATIO=$(echo "scale=2; $REMAINING_DURATION / $SOUNDTRACK_DURATION" | bc -l)
echo "Required speed-up ratio: ${SPEED_RATIO}x"

# Save values for other scripts
echo "SOUNDTRACK_DURATION=$SOUNDTRACK_DURATION" > speedup_config.txt
echo "REMAINING_DURATION=$REMAINING_DURATION" >> speedup_config.txt
echo "SPEED_RATIO=$SPEED_RATIO" >> speedup_config.txt

echo "✓ Speed-up configuration saved to speedup_config.txt" 