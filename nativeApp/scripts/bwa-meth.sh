#!/bin/bash

# This script will run the analysis of the samples using bwa-meth and produce bed files

####################################################################

####the following code assumes the reference is human #####
if [ "$genome" == "hg19" ] || [ "$genome" == "hg38" ]; then

#Sets the human reference genome to be used in alignment
python bwameth.py index /reference/human/genome/"$1".fa

#naviagte to the scratch folder to place the bed files 
cd /data/scratch/pileometh/

#align all of the samples in the data/input folder, and maintain sample names
for filename in /data/input/*; do
    #align all of the samples, and produce bed files that maintain names
    python bwameth.py --reference /reference/human/genome/"$1".fa "$filename" --prefix "$filename".output
done
#complete the if statement
fi

#from here the bam files have been produced, and can be used by pileometh

######################################################################

#the following code assumes the reference is mouse #####
if [ "$genome" == "mm9" ] || [ "$genome" == "mm10" ]; then

#sets the mouse reference genome to be used in alignment
python bwameth.py index /reference/mouse/genome/"$1".fa

#naviagte to the scratch folder to place the bed files 
cd /data/scratch/pileometh/

#align all of the samples in the data/input folder, and maintain sample names
for filename in /data/input/*; do
    #align all of the samples, and produce bed files that maintain names
    python bwameth.py --reference /reference/mouse/genome/"$1".fa "$filename" --prefix "$filename".output
done
#complete the if statement
fi

#####################################################################

#from here the bam files have been produced, and can be used by pileometh
