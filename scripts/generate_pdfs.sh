#!/bin/sh
set -eu

# Requires Google Chrome and pdfbook2:
# sudo apt install texlive-extra-utils

CURRENT_DIR=`pwd`
cd ../static/print

echo "in: $PWD"

# Use the browser's print engine to preserve CSS page sizes and illustrations.
google-chrome --headless --disable-gpu --no-pdf-header-footer \
  --print-to-pdf="$PWD/insigh.io_enviro-illustrated-guide.pdf" \
  "file://$PWD/enviro-illustrated-guide.html"

# and then generate the PDF for the enviro-illustrated-guide in booklet format
pdfbook2 --paper=a4paper --short-edge --no-crop \
  $PWD/insigh.io_enviro-illustrated-guide.pdf

cd $CURRENT_DIR