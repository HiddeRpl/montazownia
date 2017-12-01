#!/bin/sh
touch alts.yaml
echo "list:" > alts.yaml
cd alts
for alt in *.alt; do
  file_name=$(echo ${alt} | sed -e "s/.alt/jpg/g")
  pl_line=$(cat ${alt} | head -n1)
  en_line=$(cat ${alt} | tail -n1)
  echo "  - name: ${file_name}" >> ../alts.yaml
  echo "    pl: ${pl_line}" >> ../alts.yaml
  echo "    en: ${en_line}" >> ../alts.yaml
done
mv ../alts.yaml ../../site/data
