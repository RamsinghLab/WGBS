#!/bin/bash

# This script will download metilene and install it inside the /software/ folder

cd /software/
wget  http://www.bioinf.uni-leipzig.de/Software/metilene/metilene_v02-3.tar.gz
    tar xzvf metilene_v02-3.tar.gz
    cd metilene_v0.2-3/
    make 
