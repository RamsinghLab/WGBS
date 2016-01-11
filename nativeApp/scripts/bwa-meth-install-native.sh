#!/bin/bash

# This script will download bwa-meth and install it inside the /software/ folder

#install the bwa-meth software
cd /software/
wget https://github.com/brentp/bwa-meth/archive/v0.10.tar.gz
    tar xzvf v0.10.tar.gz
    cd bwa-meth-0.10/
    python setup.py install

cp bwa-meth-0.10 /usr/local/bin/
