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
    ##################################### the following code uses a reference genome ########################################
    #produce bedgraph files that maintain the sample id name, but are now <sampleID>.meth.bedgraph, for the input genome
    PileOMeth extract --fraction $REF1 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam
    #copy the bedgraph to a single folder for downstream processing 
    cp /data/output/appresults/"$3"/"$f1"/alignment/"$f2"_CpG.meth.bedgraph /data/output/"$projectID"/bedgraphs/"$1"/
    #move the bedgraph to the pileup genome folder 
    mv /data/output/appresults/"$3"/"$f1"/alignment/"$f2"_CpG.meth.bedgraph /data/output/appresults/"$3"/"$f1"/pileup/"$1"/
    #produce bias plots of the bam files
    PileOMeth mbias $REF1 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam "$f2".output.bias1
    
    ################################### the following code uses a reference chromosome ######################################
    #produce bedgraph files that maintain the sample id name, but are now <sampleID>_CpG.meth.bedgraph, for the input chromosome
    PileOMeth extract --fraction $REF2 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam
    #copy the bedgraph to a single folder for downstream processing 
    cp /data/output/appresults/"$3"/"$f1"/alignment/"$f2"_CpG.meth.bedgraph /data/output/"$projectID"/bedgraphs/"$2"/
    #move the bedgraph to the pileup chromosome folder 
    mv /data/output/appresults/"$3"/"$f1"/alignment/"$f2"_CpG.meth.bedgraph /data/output/appresults/"$3"/"$f1"/pileup/"$2"/
    #produce bias plots of the bam files
    PileOMeth mbias $REF2 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam "$f2".output.bias1
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
    ##################################### the following code uses a reference genome ########################################
    #produce bedgraph files that maintain the sample id name, but are now <sampleID>.meth.bedgraph, for the input genome
    PileOMeth extract --fraction $REF1 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam
    #copy the bedgraph to a single folder for downstream processing 
    cp /data/output/appresults/"$3"/"$f1"/alignment/"$f2"_CpG.meth.bedgraph /data/output/"$projectID"/bedgraphs/"$1"/
    #move the bedgraph to the pileup genome folder 
    mv /data/output/appresults/"$3"/"$f1"/alignment/"$f2"_CpG.meth.bedgraph /data/output/appresults/"$3"/"$f1"/pileup/"$1"/
    #produce bias plots of the bam files
    PileOMeth mbias $REF1 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam "$f2".output.bias1
    
    ################################### the following code uses a reference chromosome ######################################
    #produce bedgraph files that maintain the sample id name, but are now <sampleID>_CpG.meth.bedgraph, for the input chromosome
    PileOMeth extract --fraction $REF2 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam
    #copy the bedgraph to a single folder for downstream processing 
    cp /data/output/appresults/"$3"/"$f1"/alignment/"$f2"_CpG.meth.bedgraph /data/output/"$projectID"/bedgraphs/"$2"/
    #move the bedgraph to the pileup chromosome folder 
    mv /data/output/appresults/"$3"/"$f1"/alignment/"$f2"_CpG.meth.bedgraph /data/output/appresults/"$3"/"$f1"/pileup/"$2"/
    #produce bias plots of the bam files
    PileOMeth mbias $REF2 /data/output/appresults/"$3"/"$f1"/alignment/"$f2".output.bam "$f2".output.bias1
done < "$input"

#complete the if statement 
fi
