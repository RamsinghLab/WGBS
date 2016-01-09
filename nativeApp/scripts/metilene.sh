#!/bin/bash

# This script will run metilene and produce bed files

######################################################################

### the following code assumes the reference is human #####
if [ "$genome" == "hg19" ] || [ "$genome" == "hg38" ]; then

#naviagte to the scratch folder to place the bedgraph files 
cd /data/scratch/sushi/

#use metilene on the text file to create bed files for use by sushi
metilene -t 32 /data/scratch/metilene/NS_for_metilene.txt | sort -V -k1,1 -k2,2n > metilene_DMR_calls.bed

#conclude the if statement 
fi


#######################################################################

### the following code assumes the reference is mouse ####
if [ "$genome" == "mm9" ] || [ "$genome" == "mm10" ]; then

#naviagte to the scratch folder to place the bedgraph files 
cd /data/scratch/sushi/

#use metilene on the text file to create bed files for use by sushi
metilene -t 32 /data/scratch/metilene/NS_for_metilene.txt | sort -V -k1,1 -k2,2n > metilene_DMR_calls.bed

#conclude the if statement 
fi
