#add the source to the BioConductor R package
source("https://bioconductor.org/biocLite.R")
#install the desired package
biocLite("Sushi")
#update all old packages 
install.packages( 
    lib  = lib <- .libPaths()[1],
    pkgs = as.data.frame(installed.packages(lib), stringsAsFactors=FALSE)$Package,
    type = 'source'
)
