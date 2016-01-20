#!/bin/bash

# This script will run pileometh and produce fractions
# the script applies to both the human and mouse 
######################################################################

#pileup all of the samples in the data/input/samples/ folder, and maintain sample names
input="/data/scratch/samplenames.csv"
IFS=","
while read f1 f2
do
    cd /data/output/appresults/"$3"/"$f1"/pileup/
    PileOMeth extract --fraction /reference/mouse/chromosome/"$1"/"$2".fa /data/output/appresults/"$3"/"$f1"/alignment/"$f2"
done < "$input"

#complete the if statement 
fi


######################################################################

