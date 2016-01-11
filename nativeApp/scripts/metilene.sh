#!/bin/bash

# This script will run metilene and produce bed files

######################################################################

#naviagte to the scratch folder to place the bedgraph files 
cd /data/scratch/manhattan/

#use metilene on the text file to create the bed file for use by plot.py
metilene -t 32 /data/scratch/metilene/counts.txt | sort -V -k1,1 -k2,2n > metilene_DMR_calls.bed


