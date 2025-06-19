#!/bin/bash

# Script to create text overlays for the sped-up section
# Text moves left to right, alternates between top and bottom
# White text, black background, 24px font, 3px padding

echo "Creating text overlays configuration..."

# Load speed-up configuration
source speedup_config.txt

# Calculate time scaling for text positions based on speed-up ratio
# Text timings from edit.txt need to be adjusted for the speed-up

# Create drawtext filter chain with alternating positions
# Position calculation: top = y=50, bottom = y=h-100
# Text moves from left to right: x='t*100'
# Font size 24px, padding 3px

cat > text_overlays.txt << 'EOF'
# Text overlays with timeline from edit.txt
# Format: start_time:end_time:text:position (0=top, 1=bottom)

1.5:2.2:Start chatting:0
2.2:3.0:auto title:1
3.0:4.0:reasoning:0
4.0:4.5:more activate more models:1
4.5:4.7:attachements:0
4.7:5.8:SO SLEEK:1
5.8:6.5:attachements for real:0
6.5:6.75:fold Everything:1
6.75:6.83:Copy Everything:0
6.83:7.0:Virtual FS:1
8.0:8.73:streaming codeblocks with controls:0
8.73:9.03:message versions:1
9.03:10.13:Rules and tags:0
10.13:10.83:system prompt:1
10.83:12.33:Tools:0
12.33:12.83:prompt parameters:1
12.83:14.17:race and combine:0
14.17:14.83:follow the streaming:1
14.83:15.33:you can do it deepseek:0
15.33:16.33:custom blocks rendering:1
16.33:17.5:enhance prompt:0
17.5:18.0:claude being claude:1
18.0:18.42:regen:0
18.42:18.67:summarizing:1
18.67:19.33:edit response:0
19.33:20.33:prompt library:1
20.33:27.33:SOOOOOOOOOOOOO SLLLLLLEEEEEK DUDE:0
28.5:29.17:agents:1
29.17:29.58:with tasks:0
29.58:30.17:workflows:1
30.17:31.17:OOOOH COME ON - you for real:0
32.83:33.33:everything is fiiiine:1
33.33:35.17:save yo workflows:0
35.17:36.5:Claude claude claude:1
36.5:37.0:projects:0
37.0:38.0:toooo much SETTTIIINGSSS:1
38.0:38.67:mcp servers and stdio bridge:0
38.67:39.0:imports exports clean up:1
39.0:40.33:git:0
40.33:41.0:here you go buddy keep digging:1
41.0:42.0:Git authentication:0
42.0:43.0:fantastic showcase:1
43.0:43.33:broke git vfs integration meeeeh:0
43.33:43.83:it syncs IT SSYYYYNCS:1
43.83:44.0:there you go that was tedious:0
EOF

echo "✓ Text overlays configuration created: text_overlays.txt" 