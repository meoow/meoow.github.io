Title: resize images in given size using ffmpeg
Date: 2015-05-12 21:33
Modified: 
Category: Article
Tags: Bash,FFmpeg
Authors: meoow
Summary: 

```bash
#!/bin/bash

shopt -s extglob

width=320
height=240

resize() {
 ffmpeg -loglevel error -y -i "$1" -c:v mjpeg -q:v 0 -frames:v 1 -vf scale=" 'if( gte( (iw/$width)/(ih/$height),1 ), -2, $width ):if( gte( (iw/$width)/(ih/$height),1 ), $height , -2)' ",crop=" 'min(iw,$width):min(ih,$height):if( eq(iw,$width), 0, (iw-$width)/2+if( eq(iw,$width), 0,$offset) ):if( eq(ih,$height), 0, (ih-$height)/2+if( eq(ih, $height), 0,$offset) )' ",unsharp=3:3:0.45:3:3:0  -sws_flags lanczos -an -sn -f rawvideo ${1%.+([^.])}_resizesharp.jpg
  # ffmpeg -loglevel error -y -i "$1" -c:v mjpeg -q:v 0 -frames:v 1 -vf scale=" 'if( gte( (iw/$width)/(ih/$height),1 ), -2, $width ):if( gte( (iw/$width)/(ih/$height),1 ), $height , -2)' ",crop=" 'min(iw,$width):min(ih,$height):if( eq(iw,$width), 0, (iw-$width)/2+if( eq(iw,$width), 0,$offset) ):if( eq(ih,$height), 0, (ih-$height)/2+if( eq(ih, $height), 0,$offset) )' "  -sws_flags lanczos -an -sn -f rawvideo ${1%.+([^.])}_resize.jpg
}

if [[ "$2" =~ ^-?(0|[1-9][0-9]+)$ ]];then
  offset=$2
  resize "$1"
else
  offset=0
  for x in "$@";do
	resize "$x"
  done
fi
```
