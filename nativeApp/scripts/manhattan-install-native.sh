#this script will download the packages used to plot the bed files in a manhattan plot

cd /software/
apt-get install unzip
wget https://github.com/brentp/bio-playground/archive/master.zip
unzip bio-playground-master.zip
rm bio-playground-master.zip

