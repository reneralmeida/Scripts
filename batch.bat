for %%a in ("*.mkv") do "path to ffmpeg exe" -i %%a -bsf imxdump -c:v copy -c:a copy -f mpegts %%~na.mov