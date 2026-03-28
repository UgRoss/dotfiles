---
name: ffmpeg-video
description: Use when asked to optimize video, compress video, convert video to GIF, convert between video formats, trim video, or any ffmpeg media processing task
---

# ffmpeg Video Processing

## Output Location

Save output files to `~/Screenshots` unless specified otherwise.

## Quick Reference

### Optimize / Compress Video
```sh
# Good quality, smaller file (web-friendly)
ffmpeg -i input.mp4 -vcodec libx264 -crf 28 -preset slow output.mp4

# Aggressive compression (demos, PRs — quality loss acceptable)
ffmpeg -i input.mp4 -vcodec libx264 -crf 35 -preset slow output.mp4
```
`crf`: 18 = near-lossless, 28 = good/small, 35 = small/lossy. Default: 28.

---

### Convert Video to GIF
```sh
# Step 1: generate palette (better colors)
ffmpeg -i input.mp4 -vf "fps=15,scale=800:-1:flags=lanczos,palettegen" palette.png

# Step 2: create GIF using palette
ffmpeg -i input.mp4 -i palette.png -vf "fps=15,scale=800:-1:flags=lanczos[x];[x][1:v]paletteuse" output.gif

# Quick one-liner (lower quality, no palette)
ffmpeg -i input.mp4 -vf "fps=10,scale=600:-1" output.gif
```
Use two-step for PRs/docs. Adjust `fps` (10–15) and `scale` (width, `-1` = auto height).

---

### Convert Format
```sh
# MP4 → WebM
ffmpeg -i input.mp4 -c:v libvpx-vp9 -crf 30 output.webm

# MOV → MP4 (lossless copy, fast)
ffmpeg -i input.mov -c copy output.mp4

# Any format, re-encode
ffmpeg -i input.mov -vcodec libx264 -acodec aac output.mp4
```

---

### Trim Video
```sh
# Cut from 0:10 to 0:30
ffmpeg -i input.mp4 -ss 00:00:10 -to 00:00:30 -c copy output.mp4
```

---

### Strip Audio
```sh
ffmpeg -i input.mp4 -an -c:v copy output.mp4
```

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| GIF too large | Lower `fps` (10) and `scale` (480 or 600) |
| Format won't play in browser | Use `libx264` + `.mp4` |
| Slow conversion | Add `-preset fast` (trades size for speed) |
| `-c copy` gives errors | Re-encode: remove `-c copy`, add `-vcodec libx264` |
