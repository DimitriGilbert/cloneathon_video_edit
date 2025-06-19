#!/bin/bash

# Script to create HIGH QUALITY intro part at normal speed (first 10 seconds)
# Based on edit.txt: "10" : configurable provider [speed up after]"
# Uses NVIDIA GPU acceleration with HIGH QUALITY settings - MATCHES SOURCE AV1 CODEC

echo "Creating HIGH QUALITY intro part (first 10 seconds at normal speed)..."

# Extract first 10 seconds at normal speed with HIGH QUALITY GPU acceleration - AV1 encoding
ffmpeg -hwaccel cuda -hwaccel_output_format cuda -i clean_audio.mkv \
  -t 10 \
  -c:v av1_nvenc -preset slow -cq 18 -b:v 8000k -maxrate 12000k \
  -c:a aac -b:a 256k -ar 48000 \
  intro_normal.mkv

echo "✓ HIGH QUALITY intro created: intro_normal.mkv (10 seconds)"
echo "  Quality settings: AV1 CQ 18, 8Mbps video, 256k audio"
echo "  GPU acceleration: AV1_NVENC slow preset for maximum quality" 