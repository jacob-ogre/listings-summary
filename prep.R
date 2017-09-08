library(dplyr)

load("data/county_topo.rda")
load("data/esacounties.rda")
load("data/TECP_data.rda")
load("data/TECP_domestic.rda")
load("data/county_attrib.rda")

#######################################################################
# COUNTIES

counties <- group_by(esacounties, GEOID) %>%
  summarise(count = n())

counties <- left_join(
  counties,
  select(county_attrib, GEOID, INTPTLAT, INTPTLON, NAME),
  by = "GEOID"
)
saveRDS(counties, file="data/counties_df.rds")

