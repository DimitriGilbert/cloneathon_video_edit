#!/bin/bash

# Script to extract audio from raw.mkv to raw.aac
# Based on the examples in bash_history

echo "Extracting audio from raw.mkv to raw.aac..."

# Extract audio without video, keeping original audio codec
ffmpeg -i raw.mkv -vn -acodec copy raw.aac

echo "✓ Audio extraction complete: raw.aac created" 