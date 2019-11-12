#!/bin/bash

function usage() {
  echo "Usage $0 width height"
  exit 1
}

if [ -z "$1" ]; then
  usage
fi
if [ -z "$2" ]; then
  usage
fi

width=$1
height=$2
point=`expr $width / 2`

mkdir images

for f in bmp gif jpeg jpg png tiff tif; do
  convert -size ${width}x${height} xc:'#6969' \
    -pointsize $point \
    -gravity center \
    -fill black \
    -stroke white \
    -draw "text 0,0 $f" images/${width}x${height}.$f
done

echo "Create Example Images! \n
      cd images"
