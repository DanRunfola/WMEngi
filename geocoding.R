#Geocoding
library(ggmap)

engi_jobs <- read.csv("/home/dan/Desktop/GitRepo/WMEngi/Data/engineer_jobs_VA.csv", head=FALSE, na.strings="\n")
#geocode("Williamsburg, VA", source="dsk")

for (i in 1:length(engi_jobs))
{
    engi_jobs[i,]["V4"] <- gsub("\n", "", as.character(engi_jobs[i,]["V1"]))  
}

