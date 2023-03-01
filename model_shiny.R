library(tidyverse)
library(raster)
library(sp)
library(tmap)
library(sf)
library(stars)
library(gstat)
library(rgdal)


# read the .tiff files
resto_model_raster <- raster(here::here("demo_rasters", "resto_model_raster.tiff"))
harvest_model_raster <- raster(here::here("demo_rasters", "harvest_model_raster.tiff"))


# Load the shape file for the Channel Islands
channel_islands <- st_read(here::here("CI_data", "channel_islands.shp"))

#Import the Data Frame
area_sf <- readRDS(here::here("demo_rasters", "area_sf.rds"))

# Plot world map, add the area of interest and the raster values
data("World")

tm_shape(World) +
  tm_polygons() +
  
  tm_shape(channel_islands) +
  tm_polygons()+
  
  tm_shape(area_sf) +
  tm_borders(lwd = 1, col = "red") +
  
  tm_shape(resto_model_raster) +
  tm_raster(style = "fisher", palette = "Spectral", alpha = 0.8, title = "Restoration") +
  
  tm_shape(harvest_model_raster) +
  tm_raster(style = "fisher", palette = "YlGn", alpha = 0.8, title = "Harvest") +
  
  tm_legend(title = "Model Results") +
  tm_scale_bar(position = c("left", "bottom"), text.size = 0.7) +
  tm_view(set.view = c(-120, 34.1, 8))

tmap_mode("view")
