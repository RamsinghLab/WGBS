# WGBS-Pipeline Version 1 December 2015

There are two forms of the pipeline:

1) Native app for Basespace 

2) Localized app


Both Require the Installation of the following packages, however the initialization script will do this for you:
1) BWA-Meth: look to WGBS-Pipeline/nativeApp/Scripts for installtion

https://github.com/brentp/bwa-meth

2) Pile-O-Meth: look to WGBS-Pipeline/nativeApp/Scripts for installtion

https://github.com/dpryan79/PileOMeth

3) Bedtools: look to WGBS-Pipeline/nativeApp/Scripts for installtion

http://bedtools.readthedocs.org/en/latest/index.html

4) Metilene: look to WGBS-Pipeline/nativeApp/Scripts for installtion

http://www.bioinf.uni-leipzig.de/Software/metilene/



WGBS/nativeApp/:

~Instructions~

1) Dockerfile

2) scripts/

  a) Form_Builder.json
  
  b) call_back.js
  
  c) Dependencies/
  
    bwa_meth.sh
    pileometh.sh
    bedtools.sh
    metilene.sh
  
  c) data/input/
  
    AppSession.json
  		
  d) tmp/scripts/
  
    Full_Pipeline.sh
  		
3) Reference/

  a) Human Chromosomes: 
  
    Chr 1-22
    X, Y, M
  		
  b) Mouse Chromsomes:
  
    Chr 1-19
    X, Y, M
  
  c) Human Genomes: 
  
    HG19, HG38 
  		
  d) Mouse Genomes:
  
    mm9, mm10
  
  c) 

WGBS/Local

#before beginning this process, place all of the raw fastq files to be analyzed into the data/input folder




