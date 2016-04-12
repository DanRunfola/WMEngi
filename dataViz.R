library(sp)
library(maptools)
dj <- read.csv("/home/aiddata/Desktop/Github/WMEngi/Data/data_jobs_VA_geolocated.csv")
ej <- read.csv("/home/aiddata/Desktop/Github/WMEngi/Data/engineer_jobs_VA_geolocated.csv")

#Remove NA locations for Engi
ej.rm.na <- ej[complete.cases(ej),]

ej.coords = cbind(ej.rm.na$lon, ej.rm.na$lat)
ej.spdf <- SpatialPointsDataFrame(ej.coords, ej.rm.na)

#Write out the shapefile
writePointsShape(ej.spdf, "/home/aiddata/Desktop/Github/WMEngi/Data/engi_jobs_indeed.shp")

#Remove NA locations for Data
dj.rm.na <- dj[complete.cases(dj),]

dj.coords = cbind(dj.rm.na$lon, dj.rm.na$lat)
dj.spdf <- SpatialPointsDataFrame(dj.coords, dj.rm.na)

#Write out the shapefile
writePointsShape(ej.spdf, "/home/aiddata/Desktop/Github/WMEngi/Data/data_jobs_indeed.shp")