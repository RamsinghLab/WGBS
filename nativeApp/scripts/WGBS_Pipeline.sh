#!/bin/sh
#this is the full pipeline script to be run with basespace illumina
#the script will be a general bash script that will call all the other scripts in order, depeneding on the process/choices of the user

#first execute the python script that will parse the app session
cd /scripts/
python parse_Appsession.py

#read the text files produced by the app session and determine the genome, chromosome, projectID, and sampleNames
cd /data/scratch/
genome='cat genome.txt'
chromosome='cat chromosome.txt'
projectID='cat projectid.txt'

#the sample name csv is in the /data/scratch folder, and will be maintained as a file for directory looping in future output dumps

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

#make the output directory for the aligned bam files
#align all of the samples in the data/input/samples/ folder, and maintain sample names
input="/data/scratch/samplenames.csv"
IFS=","
#f1 is the sample name, and f2 is the sample id 
while read f1 f2
do
  mkdir -p /data/output/appresults/"$projectID"/"$f1"/alignment/
  mkdir -p /data/output/appresults/"$projectID"/"$f1"/pileup/"$genome"/
  mkdir -p /data/output/appresults/"$projectID"/"$f1"/pileup/"$chromosome"/
done < "$input"

#make the output directory for the bedgraph files, genome and chromosome based
mkdir -p /data/output/appresults/"$projectID"/bedgraphs/"$genome"/
mkdir -p /data/output/appresults/"$projectID"/bedgraphs/"$chromosome"/

#make the output directory for the unioned bedgraph text file, genome and chromosome based
mkdir -p /data/output/appresults/"$projectID"/union/"$genome"/
mkdir -p /data/output/appresults/"$projectID"/union/"$chromosome"/

#make the output directory for the annotated bed file, genome and chromosome based
mkdir -p /data/output/appresults/"$projectID"/annotated/"$genome"/
mkdir -p /data/output/appresults/"$projectID"/annotated/"$chromosome"/

#invoke the bwa-meth script with the passing of the genome variable, and place the bam files in their representative sample folders
bash bwa-meth.sh "$genome" "$projectID"

#invoke the pileometh script with the passing of genome and the chromosome, and place the bedgraphs in their representative sample folders
bash pileometh.sh "$genome" "$chromosome" "$projectID"

#invoke the unionbedgraph script and place the text file in the /data/output/"$projectID"/annotated/"$genome" or "$chromosome"
bash unionbedgraph.sh "$genome" "$chromosome" "$projectID"

#invovke the metilene script with the text file produced by unionbedgraph, and place the beds file for sushi
bash metilene.sh "$genome" "$chromosome" "$projectID"

# invoke the sushi script to plot the bed file as a manhattan plot, and many other plots forms 
R sushi.R
