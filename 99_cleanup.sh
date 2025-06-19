#!/bin/bash

# Cleanup script to remove intermediate files and prepare for fresh processing

echo "Cleaning up intermediate files..."

# Remove speedup intermediate files
if [ -f "speedup_video_only.mkv" ]; then
    echo "Removing speedup_video_only.mkv"
    rm speedup_video_only.mkv
fi

if [ -f "speedup_with_text.mkv" ]; then
    echo "Removing speedup_with_text.mkv"
    rm speedup_with_text.mkv
fi

if [ -f "speedup_section.mkv" ]; then
    echo "Removing speedup_section.mkv"
    rm speedup_section.mkv
fi

# Remove final output files
if [ -f "litechat_presentation.mkv" ]; then
    echo "Removing litechat_presentation.mkv"
    rm litechat_presentation.mkv
fi

# Remove any temporary files
if [ -f "final_filelist.txt" ]; then
    echo "Removing final_filelist.txt"
    rm final_filelist.txt
fi

echo "✓ Cleanup complete - ready for fresh processing" 