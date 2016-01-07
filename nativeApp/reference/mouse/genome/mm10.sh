#!/bin/bash

#use this script to download the mm10 mouse genome

cd ~/wgbs/reference/mouse/genome/mm10/

wget http://hgdownload.cse.ucsc.edu/goldenPath/mm10/bigZips/chromFa.tar.gz
tar -zxvf chromFa.tar.gz
cat chr*.fa > mm10.fa
rm chr*.fa
