R for Spatial Planning and Analysis
================
Robin Lovelace
2018-03-05 Week 17. For TRAN5015.

Introduction
============

Context: Sustainable Spatial Planning and Analysis
--------------------------------------------------

-   Reproducibility requires operations to be encoded in computer code
-   That is why a command line interface (CLI) is so powerful
-   Solutions are more sustainable if they can be reproduced

Requirements: students are recommended to have the latest versions of R, RStudio and QGIS installed on their computers.

Learning outcomes: students will learn how to download and visualise spatial data with R

We'll build on the datasets used in the previous practical.

Setting up a project
--------------------

Open RStudio and click on the box in the top right hand corner. Create a new project and call it something sensible, like `SSPA-R`.

You can also download the contents of the project `SSPA` that these materials were developed in, from:

<https://github.com/ITSLeeds/SSPA/archive/master.zip>

Get used to RStudio's interface, with reference to the '[RStudio Cheatsheet](https://www.rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf)' (Google it if you cannot find it!).

Getting up to speed with R
--------------------------

Based on Colin Gillespie's Introduction to R, try:

-   Creating and deleting objects
-   Basic plotting
-   Creating and saving R scripts

Before continuing

R version, installing and updating packages
-------------------------------------------

To check what version of R you're using, type the following command.

Reproducing what we did with QGIS
=================================

Data access
-----------

First, we must ensure that the data used for the QGIS tutorial is in your working directory.

You could just look at the Files tab in the bottom left of your RStudio instance to do this:

<img src="figures/rstudio-data.png" width="1029" />

You can also do the programmatically, but entering the following command:

``` r
list.dirs(recursive = FALSE)
```

    ## [1] "./accessibility practical data" "./course-info"                 
    ## [3] "./data"                         "./figures"                     
    ## [5] "./.git"                         "./QGISforSSPAdata"             
    ## [7] "./r4transport_files"            "./.Rproj.user"                 
    ## [9] "./slides"

What just happened?

We asked R to list all the directories in the working directory. Note that the output is printed to screen, and into this tutorial. The one we're interested in is element number 5:

    [5] "./QGISforSSPAdata

This exercise demonstrates the difference between a graphical user interface and doing things programmatically. Both work. But the programming way is more precise, but potentially more confusing if you're new to R.

### Challenge

1.  Look inside the QGISforSSPAdata folder. Count how many files and folders are in there manually.

2.  Now automate the process using the function `list.files()` - what is the output? Do the numbers match?

Note: this is the output you should get from the previous command:

    ## [1] "TRAN 5115 Module Handbook_201718.doc"

Reading data
------------

We'll use the **sf** package to read the data.

To install the package, use the following command:

``` r
install.packages("sf")
```

To make the functions available from the package we've just installed, use the `library` function, as follows:

``` r
library(sf)
```

    ## Linking to GEOS 3.5.1, GDAL 2.2.2, proj.4 4.9.2

Now we can use the new powers enabled by this package, like reading in a shapefile:

``` r
stns = st_read("data/stations UK/station_point.shp")
```

    ## Reading layer `station_point' from data source `/home/robin/ITSLeeds/SSPA/data/stations UK/station_point.shp' using driver `ESRI Shapefile'
    ## Simple feature collection with 2525 features and 3 fields
    ## geometry type:  POINT
    ## dimension:      XY
    ## bbox:           xmin: 147601 ymin: 30610.99 xmax: 654743 ymax: 967898.9
    ## epsg (SRID):    NA
    ## proj4string:    +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +a=6377563 +b=6356256.161 +units=m +no_defs

Note that the information printed to screen when you read this file in is useful. It tells you the data format (ESRI Shapefile), the number of features (2,525 output areas) and the coordinate reference system (CRS): the `+units=m` part of the output tells you that units of this CRS is meters.

Now that the data has been loaded into an R object, `stns`, we can query and analyse the data. To provide a simple example, find out the names of the variables in the object, using the `names()` function as follows:

``` r
names(stns)
```

    ## [1] "CODE"       "IDENTIFIER" "NAME"       "geometry"

The result tells us that there are 4 variables stored in the object (one of these, `geometry` is not really a data attribute but a geographical attribute so the data has 3 variables or `fields`).

The data can be plotted as follows:

``` r
plot(stns)
```

![](r4transport_files/figure-markdown_github/unnamed-chunk-8-1.png)

Note that three versions of the dataset are plotted: one for each variable contained in the `stns` object. These can be seen with the following command:

``` r
head(stns)
```

    ## Simple feature collection with 6 features and 3 fields
    ## geometry type:  POINT
    ## dimension:      XY
    ## bbox:           xmin: 297020 ymin: 507906 xmax: 423083 ymax: 627028.9
    ## epsg (SRID):    NA
    ## proj4string:    +proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +a=6377563 +b=6356256.161 +units=m +no_defs
    ##   CODE    IDENTIFIER       NAME                geometry
    ## 1 6155 4186290627029   Chathill POINT (418629 627028.9)
    ## 2 6155 4222020601490 Acklington   POINT (422202 601490)
    ## 3 6155 4230830611074   Alnmouth   POINT (423083 611074)
    ## 4 6155 2985920507906 Nethertown   POINT (298592 507906)
    ## 5 6155 2974200518772 Whitehaven   POINT (297420 518772)
    ## 6 6155 2970200511921    St Bees   POINT (297020 511921)

### Challenge: read and plot Harrogate data

1.  Find the file Harrogate OAC layer on your computer and load it into an object called `harrogate_oac` using the function `st_read()`.

2.  Explore the results using the `names()`, `plot()`, and `head()` commands. How many variables does the object `harrogate_aoc` have? The results of the first of these commands is shown below. \*\*Note: if you plot the object, make sure you only plot a few of the variables, e.g. those represented by `harrogate[1:3]`.

<!-- -->

    ##   [1] "OBJECTID"   "OA_SA"      "SUB_REGION" "REGION"     "POPULATION"
    ##   [6] "SPRGRP"     "GRP"        "SUBGRP"     "SPR_SED"    "GRP_SED"   
    ##  [11] "SUB_SED"    "SPR1_SED"   "SPR2_SED"   "SPR3_SED"   "SPR4_SED"  
    ##  [16] "SPR5_SED"   "SPR6_SED"   "SPR7_SED"   "SPR8_SED"   "GRP1a_SED" 
    ##  [21] "GRP1b_SED"  "GRP1c_SED"  "GRP2a_SED"  "GRP2b_SED"  "GRP2c_SED" 
    ##  [26] "GRP2d_SED"  "GRP3a_SED"  "GRP3b_SED"  "GRP3c_SED"  "GRP3d_SED" 
    ##  [31] "GRP4a_SED"  "GRP4b_SED"  "GRP4c_SED"  "GRP5a_SED"  "GRP5b_SED" 
    ##  [36] "GRP6a_SED"  "GRP6b_SED"  "GRP7a_SED"  "GRP7b_SED"  "GRP7c_SED" 
    ##  [41] "GRP7d_SED"  "GRP8a_SED"  "GRP8b_SED"  "GRP8c_SED"  "GRP8d_SED" 
    ##  [46] "SUB1a1_SED" "SUB1a2_SED" "SUB1a3_SED" "SUB1a4_SED" "SUB1b1_SED"
    ##  [51] "SUB1b2_SED" "SUB1b3_SED" "SUB1c1_SED" "SUB1c2_SED" "SUB1c3_SED"
    ##  [56] "SUB2a1_SED" "SUB2a2_SED" "SUB2a3_SED" "SUB2b1_SED" "SUB2b2_SED"
    ##  [61] "SUB2c1_SED" "SUB2c2_SED" "SUB2c3_SED" "SUB2d1_SED" "SUB2d2_SED"
    ##  [66] "SUB2d3_SED" "SUB3a1_SED" "SUB3a2_SED" "SUB3b1_SED" "SUB3b2_SED"
    ##  [71] "SUB3b3_SED" "SUB3c1_SED" "SUB3c2_SED" "SUB3d1_SED" "SUB3d2_SED"
    ##  [76] "SUB3d3_SED" "SUB4a1_SED" "SUB4a2_SED" "SUB4a3_SED" "SUB4b1_SED"
    ##  [81] "SUB4b2_SED" "SUB4c1_SED" "SUB4c2_SED" "SUB4c3_SED" "SUB5a1_SED"
    ##  [86] "SUB5a2_SED" "SUB5a3_SED" "SUB5b1_SED" "SUB5b2_SED" "SUB5b3_SED"
    ##  [91] "SUB6a1_SED" "SUB6a2_SED" "SUB6a3_SED" "SUB6a4_SED" "SUB6b1_SED"
    ##  [96] "SUB6b2_SED" "SUB6b3_SED" "SUB6b4_SED" "SUB7a1_SED" "SUB7a2_SED"
    ## [101] "SUB7a3_SED" "SUB7b1_SED" "SUB7b2_SED" "SUB7b3_SED" "SUB7c1_SED"
    ## [106] "SUB7c2_SED" "SUB7c3_SED" "SUB7d1_SED" "SUB7d2_SED" "SUB7d3_SED"
    ## [111] "SUB7d4_SED" "SUB8a1_SED" "SUB8a2_SED" "SUB8b1_SED" "SUB8b2_SED"
    ## [116] "SUB8c1_SED" "SUB8c2_SED" "SUB8c3_SED" "SUB8d1_SED" "SUB8d2_SED"
    ## [121] "SUB8d3_SED" "Shape_Leng" "Shape_Area" "geometry"

Subsetting data
---------------

This section assumes you have an object called `harrogate_aoc` loaded into your R environment. As with the location of files, you can check this in two ways, using either the GUI or the CLI. (Quicktest: what is a GUI? What is a CLI?)

The GUI method involves clicking on the right part of the screen if the Environment pane isn't already visible in the top left of your RStudio console. The CLI method uses the `ls()` (short for list objects) function as follows:

``` r
ls()
```

    ## [1] "harrogate_oac" "stns"

### Subsetting based on attribute

Now we've establised that the `harrogate_aoc` data is definitely there, we can sub-set it as follows:

``` r
h_sel = harrogate_oac[harrogate_oac$SPRGRP == 1,]
```

Let's see what we've subsetted but plotting the result for the relevant variable:

``` r
plot(h_sel["SPRGRP"])
```

![](r4transport_files/figure-markdown_github/unnamed-chunk-14-1.png)

What just happened? The subsetting command used the square brackets (`[]`) to select only the features of interest and then we plotted the result for a single variable.

That may seem complicated and confusing, but it's actually a highly efficient way of subsetting geographical data. Remeber the long-winded QGIS way of doing it, for example:

-   Open the attribute table of the Harrogate OAC layer1.
-   Press the select using an expression button
-   In the following dialog find fields and values group. Open it and find the SPRGRP field. Double click it.
-   Then press the “=” button in the operators group.
-   Then type 1 in the Expression. It should look like the screen grab below
-   Then press OK. Then press Close

It is impressive that R can undertake all of those steps in a single line of code!

### Subsetting based on location

This section assumes you have the `stns` and `harrogate_oac` objects in your environment. If so, let's proceed to subset the stations.

To recall where we're at, let's re-plot the stations data, with only one variable, and overlay the oac data on top:

``` r
plot(stns[1])
plot(harrogate_oac[1], add = TRUE)
```

![](r4transport_files/figure-markdown_github/unnamed-chunk-15-1.png)

To subset only the stations within Harrogate involves two steps.

First, you ensure that both datasets have the same CRS:

``` r
st_crs(stns) <- st_crs(harrogate_oac)
```

    ## Warning: st_crs<- : replacing crs does not reproject data; use st_transform
    ## for that

Then we can use square brackets, as before, but with another spatial dataset used to subset the relevant objects:

``` r
stns_harrogate = stns[harrogate_oac,]
plot(harrogate_oac[1])
plot(stns_harrogate[1], add = TRUE, col = "black", pch = 16, cex = 3)
```

![](r4transport_files/figure-markdown_github/unnamed-chunk-17-1.png)

There are other ways to get the same result.

``` r
sel_over = st_overlaps(stns, harrogate_oac)
head(sel_over[[1]])
```

    ## integer(0)

Further resources
=================

-   The RStudio Cheatsheet: <https://www.rstudio.com/wp-content/uploads/2016/01/rstudio-IDE-cheatsheet.pdf>
-   stplanr tutorials:
    -   <https://cran.r-project.org/web/packages/stplanr/vignettes/introducing-stplanr.html>
    -   <https://cran.r-project.org/web/packages/stplanr/vignettes/stplanr-paper.html>
-   Efficient R Programming book: <https://csgillespie.github.io/efficientR/>
-   [Creating Maps With R](https://github.com/Robinlovelace/Creating-maps-in-R) is a good resource for basic mapping in R, using the **sp** package
