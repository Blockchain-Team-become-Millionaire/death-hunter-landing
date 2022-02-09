#### VIDEO WITHOUT AUIDO WORK ON IOS

```
ffmpeg -i background.mp4 -c:v libx264 -profile:v main -vf format=yuv420p -c:a aac -movflags +faststart -an output.mp4
```

#### WEBM

```
ffmpeg -i background.mp4 -c:v libvpx-vp9 -crf 30 -b:v 0 -c:a libopus -an background-new.webm
```
