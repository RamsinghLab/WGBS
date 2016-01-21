#!/bin/bash

# This script will run the analysis of the samples using bwa-meth and produce bam files

####################################################################

####the following code assumes the reference is human #####
if [ "$1" == "hg19" ] || [ "$1" == "hg38" ]; then

#Sets the human reference genome to be used in alignment
REF='/reference/human/genome/"$1".fa'
#index the reference
python bwameth.py index $REF

#align all of the samples in the data/input/samples/ folder, and maintain sample names
input="/data/scratch/samplenames.csv"
IFS=","
#f1 is the sample name, and f2 is the sample id 
while read f1 f2
do
    #creates bam files for each fastq
    python bwameth.py --reference $REF /data/input/samples/"$f2".fastq --prefix /data/output/appresults/"$2"/"$f1"/"$f2".output
    #produce png bias plots for each bam file along with a text file
    python bias-plot.py /data/output/appresults/"$2"/"$f1"/"$f2".output.bam $REF
done < "$input"

#complete the if statement 
fi

#from here the bam files have been produced, and can be used by pileometh

######################################################################

#the following code assumes the reference is mouse #####
if [ "$1" == "mm9" ] || [ "$1" == "mm10" ]; then

#sets the mouse reference genome to be used in alignment
REF='/reference/mouse/genome/"$1".fa'
#index the reference
python bwameth.py index $REF

#align all of the samples in the data/input/samples/ folder, and maintain sample names
input="/data/scratch/samplenames.csv"
IFS=","
#f1 is the sample name, and f2 is the sample id 
while read f1 f2
do
    #creates bam files for each fastq
    python bwameth.py --reference $REF /data/input/samples/"$f2".fastq --prefix /data/output/appresults/"$2"/"$f1"/"$f2".output
    #produce png bias plots for each bam file along with a text file
    python bias-plot.py /data/output/appresults/"$2"/"$f1"/"$f2".output.bam $REF
done < "$input"

#complete the if statement 
fi

#####################################################################

#from here the bam files have been produced, and can be used by pileometh
