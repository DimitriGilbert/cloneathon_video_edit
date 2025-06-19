#!/bin/bash

# Script to create the sped-up section with HIGH QUALITY text overlays and soundtrack
# Takes video from 10s onwards, speeds it up, adds key text overlays, replaces audio
# Uses NVIDIA GPU acceleration with HIGH QUALITY settings - MATCHES SOURCE AV1 CODEC

echo "Creating HIGH QUALITY sped-up section with text overlays and soundtrack..."

# Load speed-up configuration
source speedup_config.txt

echo "Using speed ratio: ${SPEED_RATIO}x"

# Extract section from 10 seconds onwards and speed it up with GPU acceleration - HIGH QUALITY AV1
echo "Step 1: Creating HIGH QUALITY sped-up video with GPU acceleration..."
ffmpeg -hwaccel cuda -hwaccel_output_format cuda -i clean_audio.mkv \
  -ss 10 \
  -filter_complex "[0:v]setpts=PTS/${SPEED_RATIO}[spedup]" \
  -map "[spedup]" \
  -c:v av1_nvenc -preset slow -cq 18 -b:v 8000k -maxrate 12000k \
  -an \
  speedup_video_only.mkv

# Add HIGH QUALITY text overlays
echo "Step 2: Adding HIGH QUALITY text overlays..."

# Create video with HIGH QUALITY text overlays - better rendering and positioning
ffmpeg -i speedup_video_only.mkv \
  -vf "drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='▶ Start chatting':fontsize=32:fontcolor=white:bordercolor=black:borderw=2:box=1:boxcolor=black@0.7:boxborderw=5:x=30:y=60:enable='between(t,0.5,4.0)',drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='▶ SO SLEEK UI':fontsize=32:fontcolor=white:bordercolor=black:borderw=2:box=1:boxcolor=black@0.7:boxborderw=5:x=30:y=h-100:enable='between(t,4.5,8.0)',drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='▶ Virtual FS & Tools':fontsize=32:fontcolor=white:bordercolor=black:borderw=2:box=1:boxcolor=black@0.7:boxborderw=5:x=30:y=60:enable='between(t,8.5,12.0)',drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='▶ Streaming & Controls':fontsize=32:fontcolor=white:bordercolor=black:borderw=2:box=1:boxcolor=black@0.7:boxborderw=5:x=30:y=h-100:enable='between(t,12.5,16.0)',drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='▶ Race & Combine':fontsize=32:fontcolor=white:bordercolor=black:borderw=2:box=1:boxcolor=black@0.7:boxborderw=5:x=30:y=60:enable='between(t,16.5,20.0)',drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='▶ SOOOOO SLEEK DUDE! 🔥':fontsize=32:fontcolor=white:bordercolor=black:borderw=2:box=1:boxcolor=black@0.7:boxborderw=5:x=30:y=h-100:enable='between(t,20.5,24.5)',drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='▶ Agents & Workflows':fontsize=32:fontcolor=white:bordercolor=black:borderw=2:box=1:boxcolor=black@0.7:boxborderw=5:x=30:y=60:enable='between(t,25.0,28.5)',drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:text='▶ Git Integration':fontsize=32:fontcolor=white:bordercolor=black:borderw=2:box=1:boxcolor=black@0.7:boxborderw=5:x=30:y=h-100:enable='between(t,29.0,32.5)'" \
  -c:v av1_nvenc -preset slow -cq 18 -b:v 8000k -maxrate 12000k \
  speedup_with_text.mkv

# Add soundtrack as audio with HIGH QUALITY
echo "Step 3: Adding HIGH QUALITY soundtrack..."
ffmpeg -i speedup_with_text.mkv -i soundtrack.mp3 \
  -c:v copy \
  -c:a aac -b:a 256k -ar 48000 \
  -map 0:v -map 1:a \
  -t ${SOUNDTRACK_DURATION} \
  speedup_section.mkv

# Clean up intermediate files
rm speedup_video_only.mkv speedup_with_text.mkv

echo "✓ HIGH QUALITY sped-up section created: speedup_section.mkv (${SOUNDTRACK_DURATION}s)"
echo "  Quality settings: AV1 CQ 18, 8Mbps video, 256k audio, larger fonts with borders"
echo "  GPU acceleration: AV1_NVENC slow preset for maximum quality" 