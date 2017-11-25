#!/bin/bash
cd ../site/source/images/portfolio/img
for filename in *.jpg; do
	convert ${filename} -resize 256x256 ../thumbnails/${filename}
done
echo "files:" > a.yaml
ls -l | awk '{print $NF}' | sed -e 's/^/  - /' | tail -n +3 >> a.yaml
mv a.yaml ../../../../data/img.yaml
rm -rf *.yaml
