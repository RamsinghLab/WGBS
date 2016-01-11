#!/bin/sh 

#this shell script will produce a text file to be used by metilene

######################################################################

### the following code assumes the reference is human #####
if [ "$1" == "hg19" ] || [ "$1" == "hg38" ]; then

#naviagte to the scratch folder to place the text file for metilene 
cd /data/scratch/metilene/

#take in all the bedgraph files in the /data/scratch/unionbedgraph folder
FILES=`ls /data/scratch/unionbedgraph/*.bedGraph | xargs`
NAMES=`ls /data/scratch/unionbedgraph/*.bedGraph | cut -f 1 -d_ | xargs`

bedtools unionbedg -header -names $NAMES -i $FILES > counts.txt

#conclude the if statement 
fi




####################################################################


### the following code assumes the reference is mouse #####
if [ "$1" == "mm9" ] || [ "$1" == "mm10" ]; then

#naviagte to the scratch folder to place the text file for metilene 
cd /data/scratch/metilene/

#take in all the bedgraph files in the /data/scratch/unionbedgraph folder
FILES=`ls /data/scratch/unionbedgraph/*.bedGraph | xargs`
NAMES=`ls /data/scratch/unionbedgraph/*.bedGraph | cut -f 1 -d_ | xargs`

bedtools unionbedg -header -names $NAMES -i $FILES > counts.txt

#conclude the if statement 
fi


