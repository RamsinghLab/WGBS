#!/bin/bash

# This script will run the analysis of the samples using bwa-meth and produce bam files

####################################################################

####the following code assumes the reference is human #####
if [ "$1" == "hg19" ] || [ "$1" == "hg38" ]; then

#Sets the human reference genome to be used in alignment
python bwameth.py index /reference/human/genome/"$1".fa

#align all of the samples in the data/input/samples/ folder, and maintain sample names
input="/data/scratch/samplenames.csv"
IFS=","
while read f1 f2
do
    cd /data/output/appresults/"$2"/"$f1"/alignment/
    python bwameth.py --reference /reference/human/genome/"$1".fa "$f2" --prefix "$f2"
done < "$input"

#complete the if statement 
fi

#from here the bam files have been produced, and can be used by pileometh

######################################################################

#the following code assumes the reference is mouse #####
if [ "$1" == "mm9" ] || [ "$1" == "mm10" ]; then

#sets the mouse reference genome to be used in alignment
python bwameth.py index /reference/mouse/genome/"$1".fa

#align all of the samples in the data/input/samples/ folder, and maintain sample names
input="/data/scratch/samplenames.csv"
IFS=","
while read f1 f2
do
    cd /data/output/appresults/"$2"/"$f1"/alignment/
    python bwameth.py --reference /reference/human/genome/"$1".fa "$f2" --prefix "$f2"
done < "$input"

#complete the if statement 
fi

#####################################################################

#from here the bam files have been produced, and can be used by pileometh
