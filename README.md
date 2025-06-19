# LiteChat Entry Video Processing Scripts

https://youtu.be/ytp9fF5npCg

This directory contains scripts to process the litechat_entry MKV files through a complete video processing pipeline.

## Overview

The pipeline processes 5 MKV files:
- `2025-06-19 18-07-05.mkv` (157MB)
- `2025-06-19 18-48-15.mkv` (6.3MB)
- `2025-06-19 18-53-22.mkv` (2.6MB) 
- `2025-06-19 18-55-51.mkv` (3.9MB)
- `2025-06-19 18-57-30.mkv` (6.8MB)

## Processing Steps

1. **Merge videos** → `raw.mkv`
2. **Extract audio** → `raw.aac`
3. **Enhance audio** → `clean.mp3` (10dB boost + compression)
4. **Replace audio** → `clean_audio.mkv` (final output)

## Usage

### Quick Start (Run Everything)
```bash
bash edit_script/00_run_all.sh
```

### Individual Steps
```bash
# Step 1: Merge all MKV files
bash edit_script/01_merge_videos.sh

# Step 2: Extract audio from merged video  
bash edit_script/02_extract_audio.sh

# Step 3: Enhance audio with 10dB boost and compression
bash edit_script/03_enhance_audio.sh

# Step 4: Replace audio in video with enhanced version
bash edit_script/04_replace_audio.sh
```

## Audio Enhancement Details

The audio enhancement (step 3) applies:
- **Volume boost**: +10dB 
- **Compression**: threshold=-10dB, ratio=10:1, attack=5ms, release=50ms
- **Output format**: MP3 at 192k bitrate

This is based on the `sequential_workflows_fixed.mkv` example from bash_history.

## Requirements

- FFmpeg with NVIDIA GPU acceleration support
- Sufficient disk space for intermediate files
- Input MKV files in the parent directory

## Output Files

- `raw.mkv` - Merged video from all input files
- `raw.aac` - Extracted audio from merged video
- `clean.mp3` - Enhanced audio (10dB boost + compression)
- `clean_audio.mkv` - Final video with enhanced audio

## NVIDIA GPU Acceleration

The scripts are designed to work with NVIDIA GPU acceleration when available. FFmpeg will automatically use NVENC/NVDEC if properly configured and if your system has a supported NVIDIA GPU.

## Notes

- Scripts include error checking and will stop if any step fails
- Temporary files (like filelist.txt) are automatically cleaned up
- All intermediate files are preserved for inspection/debugging
- Based on proven ffmpeg commands from your bash_history 