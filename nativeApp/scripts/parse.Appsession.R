
####
## This file parses the AppSession JSON. 
####

require("rjson")

data <- fromJSON(file="../../data/input/AppSession.json")
numberOfPropertyItems = length(data[['Properties']][['Items']])

##
# Let's fetch the property items
##

params = c()

controlID = c()
controlHref = c()
controlName = c()
controlDir = c()

compareID = c()
compareHref = c()
compareName = c()
compareDir = c()

##
# Collect all the AppSession properties
##

for (index in seq(numberOfPropertyItems)){
  
    if (data[['Properties']][['Items']][[index]]['Name'] == 'Input.session'){
        session = data[['Properties']][['Items']][[index]][['Content']]
        params = c(params, session)    
    }

    if (data[['Properties']][['Items']][[index]][['Name']] == 'Input.genome'){
        genome = data[['Properties']][['Items']][[index]][['Content']]
        params = c(params, genome)    
    }

    if (data[['Properties']][['Items']][[index]][['Name']] == 'Input.chromosome'){
        chromosome = data[['Properties']][['Items']][[index]][['Content']]
        params = c(params, chromosome)    
    }

    if (data[['Properties']][['Items']][[index]][['Name']] == 'Input.project'){
        project = data[['Properties']][['Items']][[index]][['Items']][[1]][['Id']]
        params = c(params, project)    
    }
}

fileConn1<-file("genome.txt")
writeLines(genome, fileConn)
close(fileConn1)
fileConn2<-file("chromosome.txt")
writeLines(chromosome, fileConn)
close(fileConn2)
