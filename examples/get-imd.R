# Aim: get IMD scores and mode split data at the LSOA level
# Works for any Local Authority in England:
la_name = "Richmondshire"

remotes::install_cran("snakecase")
remotes::install_github("itsleeds/pct", "national")
remotes::install_github("robinlovelace/ukboundaries")

u <- "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/467774/File_7_ID_2015_All_ranks__deciles_and_scores_for_the_Indices_of_Deprivation__and_population_denominators.csv"
d <- readr::read_csv(u)
names(d) <- snakecase::to_snake_case(names(d))
names(d)[1] = "geo_code"

# pct package download
z <- pct::get_pct(layer = "z", geography = "lsoa", national = TRUE)
zm <- dplyr::inner_join(z, d)
# zm

zm_lds = zm[grepl(pattern = la_name, x = zm$geo_name), ]
plot(zm_lds[c("all", "bicycle", "car_driver", "index_of_multiple_deprivation_imd_score")])
mapview::mapview(zm_lds, zcol = "index_of_multiple_deprivation_imd_score")
