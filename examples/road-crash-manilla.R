# install.packages("tidyverse")
library(tidyverse)
library(leaflet)
library(sf)

suppressWarnings(
  d <- readxl::read_excel("/tmp/Latest MMARAS ni Richard Domingo (2016).xlsx", sheet = "Unsorted Sheet Final")
  )
d
head(d$Street)
head(d$Location)
d$location_text = paste(d$`District (City)`, d$Street, d$Location)
head(d$location_text)

table(d$Classification)
d_fatal = filter(d, Classification == "Fatal")

# lonlat = ggmap::geocode(d_fatal$location_text)
# summary(lonlat)
# write_csv(lonlat, "/tmp/lonlat.csv")
lonlat = read_csv("/tmp/lonlat.csv")

d_fatal_joined = cbind(d_fatal, lonlat)
d_fatal_complete = filter(d_fatal_joined, !is.na(lon) & lon > 120)
d_sf = st_as_sf(d_fatal_complete, coords = c("lon", "lat"))
write_sf(d_sf, "/tmp/d_fatal.geojson")
leaflet() %>% addTiles() %>% addCircles(data = d_sf)
