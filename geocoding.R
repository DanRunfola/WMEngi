#Geocoding
library(ggmap)

#Lazy and just used this twice for Data / Engi... 
engi_jobs <- read.csv("/home/aiddata/Desktop/Github/WMEngi/Data/engi_jobs_VA.csv", 
                      head=FALSE, na.strings="\n", stringsAsFactors=FALSE)
#geocode("Williamsburg, VA", source="dsk")

for (i in 1:length(engi_jobs[[1]]))
{
    engi_jobs[i,]["V1"][[1]] <- gsub("[\n]|^\\s+|\\s+$", "", as.character(engi_jobs[i,]["V1"][[1]]))  
}

engi_jobs['lat'] <- NA
engi_jobs['lon'] <- NA

for (i in 1:length(engi_jobs[[1]]))
{

    if(as.character(engi_jobs[i,]["V3"]) == "Virginia" | 
                    as.character(engi_jobs[i,]["V3"]) == "United States" )
    {
        print("Skipped")
        engi_jobs[i,]["lat"] <- NA
        engi_jobs[i,]["lon"] <- NA
    }
    else
    {
        geoloc <- geocode(as.character(engi_jobs[i,]["V3"]), source="dsk")  
        engi_jobs[i,]["lat"] <- geoloc['lat']
        engi_jobs[i,]["lon"] <- geoloc['lon']
    }


}

write.csv(engi_jobs, 
          "/home/aiddata/Desktop/Github/WMEngi/Data/engi_jobs_VA_geolocated.csv")