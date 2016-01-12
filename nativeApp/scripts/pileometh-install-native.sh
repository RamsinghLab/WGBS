#!/bin/bash

# This script will download metilene and install it in /software/

cd /software/
git clone https://github.com/dpryan79/PileOMeth.git
cd /software/PileOMeth
make

