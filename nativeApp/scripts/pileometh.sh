#!/bin/bash

# This script will run pileometh and produce fractions and counts

######################################################################

### the following code assumes the reference is human #####
if [ "$genome" == "hg19" ] || [ "$genome" == "hg38" ]; then

#naviagte to the scratch folder to place the bedgraph files 
cd /data/scratch/unionbedgraph/

#take in all of the bam files in the data/scratch/pileometh folder, and maintain sample names to produce bedgraphs
for filename in /data/scratch/pileometh/*; do
    #take in all the bam files and produce count and fraction data
    PileOMeth extract --fraction --counts /reference/human/chromosome/"$1"/"$2".fa /data/scratch/pileometh/"$filename".output.bam
done

#conclude the if statement 
fi


######################################################################

### the following code assumes the reference is mouse ####
if [ "$genome" == "mm9" ] || [ "$genome" == "mm10" ]; then

#naviagte to the scratch folder to place the bedgraph files 
cd /data/scratch/unionbedgraph/

#take in all of the bam files in the data/scratch/pileometh folder, and maintain sample names to produce bedgraphs
for filename in /data/scratch/pileometh/*; do
    #take in all the bam files and produce count and fraction data
    PileOMeth extract --fraction --counts /reference/mouse/chromosome/"$1"/"$2".fa /data/scratch/pileometh/"$filename".output.bam
done

#conclude the if statement 
fi
