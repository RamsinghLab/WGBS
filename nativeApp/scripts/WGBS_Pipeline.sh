#!/bin/sh
#this is the full pipeline script to be run with basespace
#the script will be a general bash script that will call all the other scripts in order, depeneding on the process/choices of the user

#first execute the python script that will parse the app session
cd /scripts/
python parse_Appsession.py

#read the text files produced by the app session and determine the genome and chromosome
cd /scripts/
genome='cat genome.txt'
chromosome='cat chromosome.txt'

#tar the genome and chromosome needed for the analysis 

#the genome is that of a human
if [ "$genome" == "hg19" ] || [ "$genome" == "hg38" ]; then
cd /reference/human/genome/
tar -zxvf "$genome".tar.gz
cd /reference/human/chromosome/"$genome"/
tar -zxvf "$chromosome".tar.gz
fi

#the genome is that of a mouse
if [ "$genome" == "mm9" ] || [ "$genome" == "mm10" ]; then
cd /reference/mouse/genome/
tar -zxvf "$genome".tar.gz
cd /reference/mouse/chromosome/"$genome"/
tar -zxvf "$chromosome".tar.gz
fi

#now that the desired genome and chromosome have been decompressed, the analysis can proceed

#make the necessary directories for the transition files
mkdir /data/scratch/pileometh
mkdir /data/scratch/unionbedgraph
mkdir /data/scratch/metilene
mkdir /data/scratch/manhattan

#invoke the bwa-meth script with the passing of the genome variable, and place the bam files in the data/scratch/pileometh folder
bash bwa-meth.sh "$genome"

#invoke the pileometh script with the passing of genome and the chromosome, and place the bedgraphs in the data/scratch
bash pileometh.sh "$genome" "$chromosome"

#invoke the unionbedgraph script and place the text file in the data/scratch/metilene folder
bash unionbedgraph.sh 

#invovke the metilene script with the text file produced by unionbedgraph, and place the beds into the data/scratch/sushi folder
bash metilene.sh

#invoke the sushi script and place the output graphics files into the data/output folder
python manhattan.py


