#!/bin/sh
sudo apt-get install -y libjpeg-62 libjpeg62-dev
wget ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick.tar.gz
tar xfz ImageMagick.tar.gz
cd ImageMagick-*
./configure --disable-shared
make
sudo make install
cd ..
rm -rf ImageMagick*
