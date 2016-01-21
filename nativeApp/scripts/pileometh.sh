#!/bin/bash

# This script will run pileometh and produce fraction bedgraphs
######################################################################

####the following code assumes the reference is human #####
if [ "$1" == "hg19" ] || [ "$1" == "hg38" ]; then

REF1='/reference/mouse/genome/"$1".fa'
REF2='/reference/mouse/chromosome/"$1"/"$2".fa'

#pileup all of the bam files in the data/output/projectID/sampleName/alignment folder, and maintain sample IDs
input="/data/scratch/samplenames.csv"
IFS=","
#f1 is the sample name, and f2 is the sample ID
while read f1 f2
do
    #the following code uses a reference genome
    #produce bedgraph files that maintain the sample id name, but are now <sampleID>.meth.bedgraph, for the input chromosome
    PileOMeth extract --fraction $REF1 /data/output/appresults/"$3"/"$f1"/"$f2".output.bam
    #produce bias plots of the bam files
    PileOMeth mbias $REF1 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam "$f2".bias
    
    #the following code uses a reference chromosome 
    #navigate to the correct output folder 
    cd /data/output/appresults/"$3"/"$f1"/pileup/"$2"/
    #produce bedgraph files that maintain the sample id name, but are now <sampleID>.meth.bedgraph, for the input chromosome
    PileOMeth extract --fraction $REF2 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam
    #produce bias plots of the bam files
    PileOMeth mbias $REF2 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam "$f2".bias
done < "$input"

#complete the if statement 
fi

######################################################################


#the following code assumes the reference is mouse #####
if [ "$1" == "mm9" ] || [ "$1" == "mm10" ]; then

REF1='/reference/mouse/genome/"$1".fa'
REF2='/reference/mouse/chromosome/"$1"/"$2".fa'

#pileup all of the bam files in the data/output/projectID/sampleName/alignment folder, and maintain sample IDs
input="/data/scratch/samplenames.csv"
IFS=","
#f1 is the sample name, and f2 is the sample ID
while read f1 f2
do
    #the following code uses a reference genome
    #navigate to the correct output folder 
    cd /data/output/appresults/"$3"/"$f1"/pileup/"$1"/
    #produce bedgraph files that maintain the sample id name, but are now <sampleID>.meth.bedgraph, for the input chromosome
    PileOMeth extract --fraction $REF1 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam
    #produce bias plots of the bam files
    PileOMeth mbias $REF1 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam "$f2".bias
    
    #the following code uses a reference chromosome 
    #navigate to the correct output folder 
    cd /data/output/appresults/"$3"/"$f1"/pileup/"$2"/
    #produce bedgraph files that maintain the sample id name, but are now <sampleID>.meth.bedgraph, for the input chromosome
    PileOMeth extract --fraction $REF2 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam
    #produce bias plots of the bam files
    PileOMeth mbias $REF2 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam "$f2".bias
done < "$input"

#complete the if statement 
fi
