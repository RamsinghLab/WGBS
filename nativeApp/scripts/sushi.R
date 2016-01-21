#this script will install the necessary packages to use sushi, and then proceed with the analysis 

#capture the passed variables
args <- commandArgs(trailingOnly=TRUE)

#assign the captured args to variable names
genome <- arg[1]
chromosome <- arg[2]
projectID <- arg[3]

#add the source, and install the package
source("https://bioconductor.org/biocLite.R")
biocLite("Sushi")

#### this section of code produces the various bedgraph outputs for each individual sample ####
#samples are at /data/output/<projectID>/<samplename>/pileup/<genome>/*_CpG.meth.bedgraph
#set the working directory to the location of the csv with file names and sample IDs
setwd("/data/scratch/")
#read in the csv 
sampleInfo <- read.csv("samplenames.csv", header=F, sep=",", colClasses = c("character","character"))
#loop through the CSV rows to produce the plots for each bedgraph





#### this section of code produces plots for the annotated bed file ####
#samples are at /data/output/<projectID>/<samplename>/pileup/<genome>/*_CpG.meth.bedgraph
#set the working directory to the location of the csv with file names and sample IDs
