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

# Construct the file system with the folders need for software, reference genom$
RUN mkdir -p /data /reference /scripts /software
COPY reference /reference
COPY scripts /scripts

#Install Python and Pip for BWA-Meth
RUN apt-get install -y python python-dev python-distribute python-pip
RUN pip install --upgrade pip
RUN apt-get install git

#Install dependencies for scripting
RUN pip install sh

#Update
RUN apt-get update

#Run the scripts to download and unpack the software
RUN bash /scripts/toolshed-install-native.sh
RUN apt-get update
RUN bash /scripts/bwa-meth-install-native.sh
RUN apt-get update
RUN bash /scripts/metilene-install-native.sh
RUN apt-get update
RUN bash /scripts/pileometh-install-native.sh
RUN apt-get update
RUN bash /scripts/manhattan-install-native.sh
RUN apt-get update
RUN bash /scripts/bedtools-install-native.sh

RUN apt-get update
###### End Installation ###########
