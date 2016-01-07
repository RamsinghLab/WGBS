#Code that will create the image necessary for the WGBS Pipeline

####################################
# build methylation analysis container images
# Based on ubuntu
####################################
# Set the base image to ubuntu
FROM ubuntu:14.04

# File Author/Maintainer
MAINTAINER Jacob Leonard <jaleonar@usc.edu>

# Update the repository sources list
RUN apt-get update

# Construct the file system with the folders needed for software, reference genomes, and components
RUN mkdir -p /bwa-meth /pileometh /metilene /toolshed /reference /reference/bedgraphs /reference/bam 
COPY reference /reference

#Install Python and Pip for BWA-Meth
RUN apt-get install -y python python-dev python-distribute python-pip
RUN pip install --upgrade pip

#Install dependencies for scripting
RUN pip install sh

#Install union bed graph/bed tools
RUN apt-get install bedtools

#Run the scripts to download and unpack the software
RUN bash /scripts/bwa_meth.sh
RUN bash /scripts/toolshed.sh
RUN bash /scripts/metilene.sh
RUN bash /scripts/pileometh.sh

#copy the downloaded packages to the constructed directories, and then remove original 
COPY /bwa-meth-master/ /bwa-meth
COPY /

#Intall packages
RUN python /bwa-meth/setup.py install 
RUN bash /metilene/Makefile make
RUN python /toolshed/setup.py install
RUN

RUN apt-get update
###### End Installation ###########
