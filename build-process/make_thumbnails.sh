#!/bin/bash
cd $1
for filename in *.jpg; do
	convert ${filename} -resize 256x256 ../thumbnails/${filename}
done
