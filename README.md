
<!-- README.md is generated from README.Rmd. Please edit that file -->
SSPA
====

The goal of this repo is to get you up-to-speed with using R for handling spatial data.

It assumes you have a basic understanding of R and spatial data, that can be obtained by following an online tutorial such as that provided by DataCamp or by following [Chapter 2](https://geocompr.robinlovelace.net/spatial-class.html) of the online book [Geocomputation with R](https://geocompr.robinlovelace.net/).

The main tutorial is [accessability](https://github.com/ITSLeeds/SSPA/blob/master/accessability.Rmd), which is best followed as a print-out.

Before starting, you should check you have the following files in the 'working directory' of your R project. These can be downloaded from from: [github.com/ITSLeeds/SSPA/archive/master.zip](https://github.com/ITSLeeds/SSPA/archive/master.zip). In addition, the data in `accessibility practical data` and `QGISforSSPAdata` can be downloaded as .zip files in the 'releases' section of [github.com/ITSLeeds/SSPA](https://github.com/ITSLeeds/SSPA/releases).

You can check the working directory you are in with `getwd()`:

``` r
getwd()
#> [1] "/home/robin/ITSLeeds/SSPA"
```

You can double check you have all the files you need by entering this command:

``` r
list.files()
#>  [1] "accessability.Rmd"            "accessibility practical data"
#>  [3] "course-info"                  "data"                        
#>  [5] "figures"                      "LICENSE"                     
#>  [7] "QGISforSSPAdata"              "r4transport.Rmd"             
#>  [9] "README.md"                    "README.Rmd"                  
#> [11] "slides"                       "SSPA.qgs"                    
#> [13] "SSPA.qgs~"                    "SSPA.Rproj"
```
