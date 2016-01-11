#!/bin/sh 

#this shell script will produce a text file to be used by metilene

######################################################################

#naviagte to the scratch folder to place the text file for metilene 
cd /data/scratch/metilene/

#take in all the bedgraph files in the /data/scratch/unionbedgraph/ folder
FILES=`ls /data/scratch/unionbedgraph/*.bedGraph | xargs`
NAMES=`ls /data/scratch/unionbedgraph/*.bedGraph | cut -f 1 -d_ | xargs`

bedtools unionbedg -header -names $NAMES -i $FILES > counts.txt



