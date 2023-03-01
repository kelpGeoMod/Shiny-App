

library(tidyverse)

#Import the Data Frame
kelp_df <- readRDS(here::here("demo_rasters", "kelp_df.rds"))



#Print the time series
ggplot(kelp_df, aes(x = date, y = kelp_biomass)) +
  geom_line(color = "darkolivegreen") + 
  theme_classic() +
  labs(title = "Kelp Biomass Time Series",
       subtitle = "Santa Barbara Channel",
       x = "Date",
       y = "Kelp Biomass (kg)",
       caption = "data source: LTER")
