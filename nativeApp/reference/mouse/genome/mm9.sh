#!/bin/bash

#use this script to download the mm9 mouse genome

cd ~/wgbs/reference/mouse/genome/mm9/

wget http://hgdownload.cse.ucsc.edu/goldenPath/mm9/bigZips/chromFa.tar.gz
tar -zxvf chromFa.tar.gz
cat chr*.fa > mm9.fa
rm chr*.fa
