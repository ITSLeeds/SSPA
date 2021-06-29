Active travel potential and planning
================

Delivered Tuesday 6th July 9am – 11am for the [SSPA
module](http://timetable.leeds.ac.uk/teaching/202021/reporting/Individual?objectclass=module&idtype=name&identifier=TRAN5115M01&&template=SWSCUST+module+Individual&days=1-7&weeks=1-52&periods=1-21).

# 1 Explore evidence on the sustainability of housing developments

09:00 - 09:45

We will take a look at sustainability metrics related to two areas:

-   the Climate Innovation District and
-   Allerton Bywater

<img src="https://user-images.githubusercontent.com/1825120/123868425-96affd00-d927-11eb-9582-81d6c4fb6a28.png" width="40%" /><img src="https://user-images.githubusercontent.com/1825120/123868663-e5f62d80-d927-11eb-86cd-16eb2376f638.png" width="40%" />

1.  Use search engines to search online for contextual information about
    each project

-   What is it?
-   How many people will live there?
-   From first impressions will it be a sustainable site?

2.  Explore demographic data in the area

-   Look at the area surround each site on the website
    <https://datashine.org.uk>
-   What is the ‘General health’ of people living in each area (see
    [here](https://datashine.org.uk/#table=QS302EW&col=QS302EW0002&ramp=RdYlGn&layers=BTTT&zoom=14&lon=-1.3612&lat=53.7439)
    for example)?
-   What percentage of people travel to work in each area by walking
    (use the Travel to Work box to found out)?
-   What percentage of people travel to work by driving?
-   What percentage of people travel to work by cycling?
-   Bonus: explore the other variables available in DataShine and
    identify one that is relevant to transport but not usually
    considered in transport planning

3.  Use the web application at www.pct.bike to explore cycling potential
    in the Propensity to Cycle Tool (Lovelace et al. 2017)

-   Use the Propensity to Cycle to find what the cycling potential in
    the surround region is in terms of cycling to work
-   Use the Propensity to Cycle to find what the cycling potential in
    the surround region is in terms of cycling to school
-   Which roads near the development sites have the highest cycling
    potential to work
-   Which roads near the development sites have the highest cycling
    potential to school
-   Where would you build new cycle infrastructure to serve the
    development site?

![](https://user-images.githubusercontent.com/1825120/123867504-5a2fd180-d926-11eb-9b7a-1988d4b6c830.png)

Above: illustration of the PCT indicator showing cycling to school
potential

# 2 Sketching out indicator ideas

09:50 - 10:20

4.  Based on the data sources from the previous tasks, what kind of
    indicator would you develop to support active travel associated with
    new development sites?

5.  Using pen and paper or the web application www.excalidraw.com sketch
    out your ideas using only data sources in the previous exercises.
    Suggestion: use boxes to represent data (such as ‘Zones: percent who
    drive to work’ or similar) and circles to represent data processing
    steps, e.g. taking inspiration from the plot below.

![](https://user-images.githubusercontent.com/1825120/123762809-0e940e00-d8bb-11eb-8dab-0e881299bbef.png)

Note: you can see and play with an interactive version of this sketch
here:
<https://excalidraw.com/#room=32c99c4b87b78d841440,lAmWmFWV3zuCZOj2tcprXQ>

6.  Think about additional datasets that improve improve your indicator,
    e.g. data on road traffic casualties (e.g. Gilardi et al. 2021),
    carbon emissions (see <https://www.carbon.place/> ) or air quality
    (Ropkins and Tate 2021).

# 3 Getting and visualising data

10:30 - 11:00

Note: you may need to refer to documents on using QGIS e.g. Section 4.3
of the QGIS-intro workbook, if you have issues in this section.

See
<https://itsleeds.github.io/QGIS-intro/style-and-select-features.html#symbology>

7.  Create a new folder called ‘active-travel-data’

8.  Download zone (MSOA) data in the geojson format from the PCT in the
    Region data tab from the tool in [West
    Yorkshire](https://www.pct.bike/m/?r=west-yorkshire) and save it
    into the new folder

![](https://user-images.githubusercontent.com/1825120/123869655-2d30ee00-d929-11eb-945b-58d91014be27.png)

9.  Open QGIS, create a new project called ‘active-travel-planning’ and
    save it in the new folder

10. Create a map in QGIS showing the percent of trips to work made by
    driving and walking. This will involve:

-   Loading the zones data into QGIS
-   Selecting the `car_driver` column in the symbology and an
    appropriate colourscheme

11. Download data representing schools in West Yorkshire from
    <https://overpass-turbo.eu/>

-   Navigate to Leeds using the map
-   Click the Wizard button
-   Enter amenity=school and click ‘build and run query’

![](https://user-images.githubusercontent.com/1825120/123871727-f7413900-d92b-11eb-83da-364e44194fa5.png)
You may get a message saying “This query returned quite a lot of data
(approx. 2 MB).” Click ‘continue anyway’ if you do.

-   Click on Export and then download/copy as GeoJSON
-   Add the resulting data to QGIS

If you show only the Polygon layer from the OSM data representing
schools, it should look something like this:

![](https://user-images.githubusercontent.com/1825120/123872554-260bdf00-d92d-11eb-9eb1-4c580a81d982.png)

-   What are the nearest schools to Allerton Bywater and the Leeds
    Climate Innovation District?
-   How accessible are those schools from the housing developments by
    walking and cycling?
-   Bonus: Are there any danger points that could be addressed through
    specific interventions?
-   Bonus: Download another OSM dataset from OverPass, with reference to
    relevant documentation from
    <https://wiki.openstreetmap.org/wiki/Tags>

12. Bonus: Run the analysis for another region available from
    www.pct.bike

13. Bonus: Explore a development site from the web application at
    <https://actdev.cyipt.bike/>, what additional features would be
    useful for transport planners in the tool?

-   Advanced: open an ‘issue’ in the project’s ‘issue tracker’ at
    <https://github.com/cyipt/actdev/issues>

![](https://user-images.githubusercontent.com/1825120/110671502-79afbc80-81c6-11eb-9dc5-52046b1d04c8.gif)

The image above shows the ActDev tool

-   Advanced: explore simulations of travel to the development site
    using the A/B Street Simulation in the tool (Lovelace 2021). What
    are the advantages and disadvantages of this type of simulation?

![](https://user-images.githubusercontent.com/1825120/110777940-9d701280-8259-11eb-9c17-c56f5b709c83.gif)

14. How can you take new datasets, tools and concepts from this workshop
    to support your coursework submission?

# 4 References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-gilardi_multivariate_2021" class="csl-entry">

Gilardi, Andrea, Jorge Mateu, Riccardo Borgoni, and Robin Lovelace.
2021. “Multivariate Hierarchical Analysis of Car Crashes Data
Considering a Spatial Network Lattice.” *arXiv:2011.12595 \[Stat\]*,
June. <http://arxiv.org/abs/2011.12595>.

</div>

<div id="ref-lovelace_open_2021" class="csl-entry">

Lovelace, Robin. 2021. “Open Source Tools for Geographic Analysis in
Transport Planning.” *Journal of Geographical Systems*, January.
<https://doi.org/10.1007/s10109-020-00342-2>.

</div>

<div id="ref-lovelace_propensity_2017" class="csl-entry">

Lovelace, Robin, Anna Goodman, Rachel Aldred, Nikolai Berkoff, Ali
Abbas, and James Woodcock. 2017. “The Propensity to Cycle Tool: An Open
Source Online System for Sustainable Transport Planning.” *Journal of
Transport and Land Use* 10 (1).
https://doi.org/<https://doi.org/10.5198/jtlu.2016.862>.

</div>

<div id="ref-ropkins_early_2021" class="csl-entry">

Ropkins, Karl, and James E. Tate. 2021. “Early Observations on the
Impact of the COVID-19 Lockdown on Air Quality Trends Across the UK.”
*Science of The Total Environment* 754 (February): 142374.
<https://doi.org/10.1016/j.scitotenv.2020.142374>.

</div>

</div>
