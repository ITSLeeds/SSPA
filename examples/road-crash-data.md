``` r
devtools::install_github("robinlovelace/ukboundaries")
#> Using GitHub PAT from envvar GITHUB_PAT
#> Skipping install of 'ukboundaries' from a github remote, the SHA1 (1d162f0d) has not changed since last install.
#>   Use `force = TRUE` to force installation
library(ukboundaries)
#> Loading required package: sf
#> Linking to GEOS 3.5.1, GDAL 2.2.2, proj.4 4.9.2
#> Using default data cache directory ~/.ukboundaries/cache 
#> Use cache_dir() to change it.
#> Contains National Statistics data © Crown copyright and database right2018
#> Contains OS data © Crown copyright and database right, 2018
#> See https://www.ons.gov.uk/methodology/geography/licences
library(stplanr)
library(sf)
dl_stats19()
#> [1] "Data saved at: /tmp/RtmpYxkF8t/Accidents0514.csv" 
#> [2] "Data saved at: /tmp/RtmpYxkF8t/Casualties0514.csv"
#> [3] "Data saved at: /tmp/RtmpYxkF8t/Vehicles0514.csv"
a = read_stats19_ac()
#> Parsed with column specification:
#> cols(
#>   .default = col_integer(),
#>   Accident_Index = col_character(),
#>   Longitude = col_double(),
#>   Latitude = col_double(),
#>   Date = col_character(),
#>   Time = col_time(format = ""),
#>   `Local_Authority_(Highway)` = col_character(),
#>   LSOA_of_Accident_Location = col_character()
#> )
#> See spec(...) for full column specifications.
#> Warning in .parse_hms(..., order = "HM", quiet = quiet): Some strings
#> failed to parse, or all strings are NAs
names(a)
#>  [1] "Accident_Index"                             
#>  [2] "Location_Easting_OSGR"                      
#>  [3] "Location_Northing_OSGR"                     
#>  [4] "Longitude"                                  
#>  [5] "Latitude"                                   
#>  [6] "Police_Force"                               
#>  [7] "Accident_Severity"                          
#>  [8] "Number_of_Vehicles"                         
#>  [9] "Number_of_Casualties"                       
#> [10] "Date"                                       
#> [11] "Day_of_Week"                                
#> [12] "Time"                                       
#> [13] "Local_Authority_(District)"                 
#> [14] "Local_Authority_(Highway)"                  
#> [15] "1st_Road_Class"                             
#> [16] "1st_Road_Number"                            
#> [17] "Road_Type"                                  
#> [18] "Speed_limit"                                
#> [19] "Junction_Detail"                            
#> [20] "Junction_Control"                           
#> [21] "2nd_Road_Class"                             
#> [22] "2nd_Road_Number"                            
#> [23] "Pedestrian_Crossing-Human_Control"          
#> [24] "Pedestrian_Crossing-Physical_Facilities"    
#> [25] "Light_Conditions"                           
#> [26] "Weather_Conditions"                         
#> [27] "Road_Surface_Conditions"                    
#> [28] "Special_Conditions_at_Site"                 
#> [29] "Carriageway_Hazards"                        
#> [30] "Urban_or_Rural_Area"                        
#> [31] "Did_Police_Officer_Attend_Scene_of_Accident"
#> [32] "LSOA_of_Accident_Location"
a_no_na = a[!is.na(a$Latitude), ]
a_sf = st_as_sf(a_no_na, coords = c("Longitude", "Latitude"), crs = 4326)
leeds = lad2018[lad2018$lau118nm == "Leeds", ]
a_leeds = a_sf[leeds, ]
#> although coordinates are longitude/latitude, st_intersects assumes that they are planar
plot(st_geometry(a_leeds))
```

![](https://i.imgur.com/vYyZBVf.png)

