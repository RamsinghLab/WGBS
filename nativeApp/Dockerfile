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
RUN mkdir -p /reference /scripts /software
COPY reference /reference
COPY scripts /scripts

#Install dependencies
RUN apt-get update && apt-get install -y \
        python \
        python-dev \
        python-distribute \
        python-matplotlib \
        python-numpy \
        python-setuptools \
        python-scipy \
        python-pip \
        git \
        wget \
        zlib1g-dev \
        r-base \
        r-base-dev \
        libcurl4-openssl-dev \
        libxml2-dev

#Install dependencies for scripting and upgrade pip
RUN pip install \
        --upgrade pip \
        sh \
        pandas \
        statsmodels \
        seaborn

#Update
RUN apt-get update

#Run the scripts to download and unpack the software
RUN bash /scripts/toolshed-install-native.sh
RUN bash /scripts/bwa-meth-install-native.sh
RUN bash /scripts/metilene-install-native.sh
RUN bash /scripts/pileometh-install-native.sh
RUN bash /scripts/bedtools-install-native.sh

RUN apt-get update
###### End Installation ###########

