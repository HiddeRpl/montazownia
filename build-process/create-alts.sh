#!/bin/sh
cd ../site/source/images/portfolio/
files=$(ls -al | tail -n+4 | awk '{print $NF}' | sed -e 's/.jpg//g')
cd -
cd alts
for file in ${files}; do
  touch ${file}.alt
  # echo "pl ${file}" > ${file}.alt
  # echo "en ${file}" >> ${file}.alt
done
