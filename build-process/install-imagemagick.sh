#!/bin/sh
wget ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick.tar.gz
tar xvfz ImageMagick.tar.gz
cd ImageMagick-*
./configure --disable-shared
make
sudo make install
rm -rf ImageMagick*
