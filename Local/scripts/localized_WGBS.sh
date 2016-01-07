#!/bin/bash
# This script is used in the local app, and will ask the user if the analysis is human or mouse, which genome to use, and then which chromsome to align against 

inputs="/var/tmp/inputs"

echo "Hello, "$USER".  This script will prompt you for the species, genome reference, and chromsome reference for alignment and analysis."

#define the variables to be compared against for mouse and human

echo -n "Enter the species to be analyzed (human or mouse) [ENTER]: "
read species

#use if statements to parse the human and mouse cases
if  [ "$species" == "mouse" ] || [ "$species" == "Mouse" ]; then

#if the user has chosen mouse, then ask for the genome
  echo -n "Would you like to align against mm9 or mm10 [ENTER]:"
  read genome

  #if the user has selected to use mouse, then proceed with genome selection
  if [ "$genome" == "mm9" ] || [ "$genome" == "MM9" ] || [ "$genome" == "Mm9" ] || [ "$genome" == "9" ]; then

  #if the user has selected the mm9 genome, proceed with downloading the genome 
  cd ./reference/mouse/genome/
  sh mm9.sh
  
  #ask the user which chromosome they would like to align against
  echo -n "Would you like to align against chr1, chr2, chr3....chr19, chrX, chrY, or ChrM [ENTER]:"
    read chromosome
    case "$chromosome" in 
    #these cases represent the difference in choice amongst the possible chromosomes 
    "chr1") sh ;
    "chr2") ;
    "chr3") 
    "chr4") 
    "chr5")
    "chr6") 
    "chr7")
    "chr8") 
    "chr9") 
    "chr10") 
    "chr11") 
    "chr12")
    "chr13")
    "chr14")
    "chr15")
    "chr16")
    "chr17")
    "chr18")
    "chr19")
    "chrX")
    "chrY")
    "chrM")
  #if the user has selected the mm9 genome, proceed with downloading the genome 
  elif [ "$genome" == "mm10" ] || [ "$genome" == "MM10" ] || [ "$genome" == "Mm10" ] || [ "$genome" == "9" ]; then

  #if the user has selected the mm9 genome, proceed with downloading the genome 
  cd ./reference/mouse/genome/
  sh mm9.sh
  
  #ask the user which chromosome they would like to align against
  echo -n "Would you like to align against, EX: chr1, chr2, chr3....chr19, chrX, chrY, or ChrM [ENTER]:"
    read chromosome
    case "$chromosome" in 
    "chr1") ;
    "chr2") ;
    "chr3") 
    "chr4") 
    "chr5")
    "chr6") 
    "chr7")
    "chr8") 
    "chr9") 
    "chr10") 
    "chr11") 
    "chr12")
    "chr13")
    "chr14")
    "chr15")
    "chr16")
    "chr17")
    "chr18")
    "chr19")
    "chrX")
    "chrY")
    "chrM")
