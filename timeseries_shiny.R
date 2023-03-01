

library(tidyverse)

#Import the Data Frame
kelp_df <- readRDS(here::here("demo_rasters", "kelp_df.rds"))

#Get only column needed
filtered_df <- kelp_df %>%
  select(date, kelp_biomass) %>%
  rename(variable = kelp_biomass)

#Print the time series
ggplot(kelp_df, aes(x = date, y = variable)) +
  geom_line(color = "darkolivegreen") + 
  theme_classic() +
  labs(title = "Kelp Biomass Time Series",
       subtitle = "Santa Barbara Channel",
       x = "Date",
       y = "Kelp Biomass (kg)",
       caption = "data source: LTER")
