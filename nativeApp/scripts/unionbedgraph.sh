#!/bin/sh 

#this shell script will produce a text file to be used by metilene

######################################################################

### the following code assumes the reference is human #####
if [ "$genome" == "hg19" ] || [ "$genome" == "hg38" ]; then

#naviagte to the scratch folder to place the text file for metilene 
cd /data/scratch/metilene/

#take in all the bedgraph files in the /data/scratch/unionbedgraph folder


####

bedtools unionbedg -header -i [place all the filenames in the folder] -names g1_n2 g1_n3 g2_s2 g2_s3 | cut -f 1,2,4,5,6,7 > NS_for_metilene.txt 

#conclude the if statement 
fi




####################################################################

### the following code assumes the reference is mouse ####
if [ "$genome" == "mm9" ] || [ "$genome" == "mm10" ]; then

#naviagte to the scratch folder to place the bedgraph files 
cd /data/scratch/metilene/

#take in all the bedgraph files in the /data/scratch/unionbedgraph folder


####

bedtools unionbedg -header -i [place all the filenames in the folder] -names g1_n2 g1_n3 g2_s2 g2_s3 | cut -f 1,2,4,5,6,7 > NS_for_metilene.txt 

#conclude the if statement 
fi
