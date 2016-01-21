#!/bin/sh 

#this shell script will produce a text file to be used by metilene

######################################################################

#this section operates on the bedgraphs based on the desired genome

#take in all the bedgraph files in the /data/output/appresults/"$projectID"/bedgraphs/"$genome"/ folder to produce a single file

#list the files
FILES=`ls /data/output/appresults/"$3"/bedgraphs/"$1"/*.bedgraph | xargs`
#list the desired filenames
NAMES=`ls /data/output/appresults/"$3"/bedgraphs/"$1"/*.bedgraph | cut -f 1 -d_ | xargs`
#run bedtools to union the bedgraphs
bedtools unionbedg -header -names $NAMES -i $FILES > /data/output/appresults/"$3"/union/"$1"/counts.txt


########################################################################

#this section operates on the bedgraphs based on the desired chromosome

#take in all the bedgraph files in the /data/output/appresults/"$projectID"/bedgraphs/"$genome"/ folder to produce a single file

#list the files
FILES=`ls /data/output/appresults/"$3"/bedgraphs/"$2"/*.bedgraph | xargs`
#list the desired filenames
NAMES=`ls /data/output/appresults/"$3"/bedgraphs/"$2"/*.bedgraph | cut -f 1 -d_ | xargs`
#run bedtools to union the bedgraphs
bedtools unionbedg -header -names $NAMES -i $FILES > /data/output/appresults/"$3"/union/"$2"/counts.txt

