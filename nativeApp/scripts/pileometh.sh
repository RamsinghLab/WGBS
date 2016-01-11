#!/bin/bash

# This script will run pileometh and produce fractions and counts

######################################################################

### the following code assumes the reference is human #####
if [ "$1" == "hg19" ] || [ "$1" == "hg38" ]; then

#naviagte to the scratch folder to place the bedgraph files 
cd /data/scratch/unionbedgraph/

#take in all of the bam files in the data/scratch/pileometh folder, and maintain sample names to produce bedgraphs
for filename in /data/scratch/pileometh/*.bam; do
    #take in all the bam files and produce count and fraction data
    PileOMeth extract --fraction /reference/human/chromosome/"$1"/"$2".fa "$filename"
done

#conclude the if statement 
fi


######################################################################

### the following code assumes the reference is mouse ####
if [ "$1" == "mm9" ] || [ "$1" == "mm10" ]; then

#naviagte to the scratch folder to place the bedgraph files 
cd /data/scratch/unionbedgraph/

#take in all of the bam files in the data/scratch/pileometh folder, and maintain sample names to produce bedgraphs
for filename in /data/scratch/pileometh/*.bam; do
    #take in all the bam files and produce count and fraction data
    PileOMeth extract --fraction /reference/mouse/chromosome/"$1"/"$2".fa "$filename"
done

#conclude the if statement 
fi
