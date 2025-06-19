#!/bin/bash

# Script to replace audio in raw.mkv with enhanced audio
# Creates clean_audio.mkv with original video and enhanced audio

echo "Replacing audio in raw.mkv with enhanced audio..."

# Copy video stream and replace audio with enhanced version
ffmpeg -i raw.mkv -i clean.mp3 \
  -c:v copy \
  -map 0:v:0 -map 1:a:0 \
  -shortest \
  clean_audio.mkv

echo "✓ Audio replacement complete: clean_audio.mkv created" 