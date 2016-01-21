#!/bin/bash

# This script will run metilene and produce bed files

######################################################################
#the following operates on the unioned bedgraph produced for the whole genome

#define the reference
REF='/data/output/appresults/"$3"/union/"$1"/counts.txt'

#use metilene on the genome referenced text file to create the bed file for use by sushi
metilene -t 32 $REF | sort -V -k1,1 -k2,2n > data/output/appresults/"$3"/annotated/"$1"/metilene_DMR_calls_"$1".bed

######################################################################
#the following operates on the unioned bedgraph produced for the individual chromosome

#define the reference
REF='/data/output/appresults/"$3"/union/"$2"/counts.txt'

#use metilene on the genome referenced text file to create the bed file for use by sushi
metilene -t 32 $REF | sort -V -k1,1 -k2,2n > data/output/appresults/"$3"/annotated/"$2"/metilene_DMR_calls_"$2".bed

####################

#now that the bedgraphs have been annotated into a bed file, they can be plotted in sushi 
