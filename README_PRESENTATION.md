# LiteChat Entry Presentation Video Pipeline

This is the **second pipeline** for creating a presentation version of the litechat_entry video with:
- Normal speed intro (first 10 seconds)
- Sped-up demo with text overlays and soundtrack replacement

## Prerequisites

1. **First pipeline completed**: You need `clean_audio.mkv` from the main pipeline
2. **Soundtrack file**: Place `soundtrack.mp3` in the parent directory
3. **FFmpeg with text support**: Requires font access for text overlays

## Quick Start

```bash
# Make sure you have soundtrack.mp3 in the current directory
bash edit_script/10_run_all_presentation.sh
```

## Pipeline Overview

### Input Requirements
- `clean_audio.mkv` (from first pipeline: `00_run_all.sh`)
- `soundtrack.mp3` (your presentation soundtrack)

### Processing Steps

1. **Extract Intro** (`11_create_speedup_intro.sh`)
   - Takes first 10 seconds at normal speed
   - Based on edit.txt: "10" : configurable provider [speed up after]"

2. **Calculate Speed-up** (`12_get_soundtrack_duration.sh`)
   - Measures soundtrack duration
   - Calculates required speed-up ratio
   - Saves configuration for other scripts

3. **Setup Text Overlays** (`13_create_text_overlays.sh`)
   - Creates text overlay configuration
   - Based on timeline from edit.txt

4. **Create Sped-up Section** (`14_create_speedup_section.sh`)
   - Speeds up video from 10s onwards
   - Adds animated text overlays (alternating top/bottom)
   - Replaces audio with soundtrack
   - Duration matches soundtrack length

5. **Combine Final Video** (`15_combine_final_presentation.sh`)
   - Concatenates intro + sped-up sections
   - Creates final `litechat_presentation.mkv`

## Text Overlay Features

- **Font**: DejaVu Sans Bold, 24px (perfect for 1080p)
- **Style**: White text on black background with 3px padding
- **Animation**: Slides from right to left
- **Position**: Alternates between top (y=50) and bottom (y=h-80)
- **Key Messages**: Extracted from edit.txt timeline

### Sample Text Overlays
- "▶ Start chatting" (top)
- "▶ SO SLEEK UI" (bottom)  
- "▶ Virtual FS & Tools" (top)
- "▶ Streaming & Controls" (bottom)
- "▶ SOOOOO SLEEK DUDE! 🔥" (bottom)
- "▶ Agents & Workflows" (top)
- "▶ Git Integration" (bottom)

## Output Files

- `intro_normal.mkv` - 10 second normal-speed intro
- `speedup_section.mkv` - Sped-up demo with text and soundtrack
- `litechat_presentation.mkv` - **FINAL OUTPUT**
- `speedup_config.txt` - Configuration data
- `text_overlays.txt` - Text timing reference

## Final Video Structure

```
litechat_presentation.mkv:
├── 0-10s: Normal speed intro (original audio)
└── 10s+: Sped-up demo (soundtrack audio + text overlays)
```

## Individual Script Usage

If you need to run steps individually:

```bash
# Step 1: Create intro
bash edit_script/11_create_speedup_intro.sh

# Step 2: Calculate speed-up ratio  
bash edit_script/12_get_soundtrack_duration.sh

# Step 3: Setup text overlays
bash edit_script/13_create_text_overlays.sh

# Step 4: Create sped-up section
bash edit_script/14_create_speedup_section.sh

# Step 5: Combine final video
bash edit_script/15_combine_final_presentation.sh
```

## Notes

- Speed-up ratio is automatically calculated based on soundtrack duration
- Text timings are simplified but cover key demo highlights
- NVIDIA GPU acceleration will be used if available
- All intermediate files are preserved for debugging
- Based on your edit.txt timeline and bash_history examples

## Troubleshooting

- **Missing clean_audio.mkv**: Run the main pipeline first (`00_run_all.sh`)
- **Missing soundtrack.mp3**: Place your soundtrack file in the current directory
- **Font errors**: Script uses system fonts, adjust path if needed
- **Speed too fast/slow**: Adjust soundtrack duration or manually edit `speedup_config.txt` 