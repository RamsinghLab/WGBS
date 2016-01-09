#!/bin/sh
#this script will install the unionbedgraph software in the ~/WGBS/Local/software folder

cd /software/
wget https://github.com/arq5x/bedtools2/releases/download/v2.25.0/bedtools-2.25.0.tar.gz
tar -zxvf bedtools-2.25.0.tar.gz
cd bedtools-2.25.0
make
