#!/bin/bash

# This script will download metilene and install it

cd /wgbs/software
git clone https://github.com/dpryan79/PileOMeth.git

cd PileOMeth/
make
