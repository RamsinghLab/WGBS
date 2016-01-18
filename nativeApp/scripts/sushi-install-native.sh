#!/bin/bash
#this R script will initialize R, and then install the sushi packages 

R
source("https://bioconductor.org/biocLite.R")
biocLite("Sushi")
