#!/bin/bash

# Script to enhance audio with 10dB boost and compression
# Based on the sequential_workflows example in bash_history and NVIDIA GPU acceleration

echo "Enhancing audio with 10dB boost and compression..."

# Apply audio enhancement with volume boost and compression
# Based on the sequential_workflows_fixed.mkv command in bash_history
ffmpeg -i raw.aac \
  -af "volume=10dB,acompressor=threshold=-10dB:ratio=10:attack=5:release=50" \
  -c:a mp3 -b:a 192k \
  clean.mp3

echo "✓ Audio enhancement complete: clean.mp3 created" 