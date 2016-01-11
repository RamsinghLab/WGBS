#!/bin/bash

# This script will download toolshed and install it inside the /software/ folder

cd /software/
wget https://pypi.python.org/packages/source/t/toolshed/toolshed-0.4.0.tar.gz
    tar xzvf toolshed-0.4.0.tar.gz
    cd toolshed-0.4.0
    python setup.py install

cp toolshed-0.4.0 /ur/local/bin/
