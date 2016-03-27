fname=/home/zorbash/Pictures/interval/`date +"%m_%d_%y_%H%M%S"`

fswebcam -r 1024x768 --jpeg 85 ${fname}.jpg
convert ${fname}.jpg -resize 1920x1080 ${fname}.jpg

export DISPLAY=:0

scrot ${fname}s.jpg

montage -mode concatenate -tile 1x ${fname}s.jpg ${fname}.jpg ${fname}_combined.jpg
