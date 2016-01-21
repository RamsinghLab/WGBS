#this script will install the necessary packages to use sushi, and then proceed with the analysis 

#capture the passed variables
args <- commandArgs(trailingOnly=TRUE)

#assign the captured args to variable names
genome <- arg[1]
chromosome <- arg[2]
projectID <- arg[3]


########################################################################################################

#### this section of code produces the various bedgraph outputs for each individual sample ####
#samples are at /data/output/<projectID>/<samplename>/pileup/<genome> or <chromosome>/*.meth.bedgraph
#set the working directory to the location of the csv with file names and sample IDs
setwd("/data/scratch/")
#read in the csv 
sampleInfo <- read.csv("samplenames.csv", header=F, sep=",", colClasses = c("character","character"))
#loop through the CSV rows to produce the plots for each bedgraph

plotBedgraph()



########################################################################################################


#### this section of code produces plots for the annotated bed file ####
#samples are at /data/output/<projectID>/annotated/(genome) or (chromosome)

###### the following code is operating on the genome oriented bed file ###### 
#set the working directory to the location of the bed file
setwd("/data/output/appresults/(projectID)/annotated/(genome)/")

# begin the use of sushi to produce plots
plotManhattan()
plotBed()


###### the following code is operating on the chromosome oriented bed file ###### 
#set the working directory to the location of the bed file
setwd("/data/output/appresults/(projectID)/annotated/(chromosome)/")

# begin the use of sushi to produce plots
plotManhattah()
plotBed()

########################################################################################################
