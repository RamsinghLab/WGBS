#!/bin/sh
#this script will download and install the R, as well as the sushi bioconductor files in /software/

cd /software/
apt-get -y install r-base
R source("https://bioconductor.org/biocLite.R")
biocLite("Sushi")
