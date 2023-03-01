library(tidyverse)
library(raster)
library(sp)
library(tmap)
library(sf)
library(stars)
library(gstat)
library(rgdal)


# read the .tiff files
kelp_raster <- raster(here::here("demo_rasters", "kelp_raster.tiff"))
depth_raster <- raster(here::here("demo_rasters", "depth_raster.tiff"))
sst_raster <- raster(here::here("demo_rasters", "sst_raster.tiff"))
NO3_raster <- raster(here::here("demo_rasters", "NO3_raster.tiff"))
NO2_raster <- raster(here::here("demo_rasters", "NO2_raster.tiff"))
NH4_raster <- raster(here::here("demo_rasters", "NH4_raster.tiff"))

# Load the shape file for the Channel Islands
channel_islands <- st_read(here::here("CI_data", "channel_islands.shp"))

#Import the Data Frame
area_sf <- readRDS(here::here("demo_rasters", "area_sf.rds"))

# Plot world map, add the area of interest and the raster values
data("World")

map <- tm_shape(World) +
  tm_polygons() +
  
  tm_shape(channel_islands) +
  tm_polygons()+
  
  tm_shape(area_sf) +
  tm_borders(lwd = 1, col = "red") +
  
  # tm_shape(kelp_raster) +
  # tm_raster(style = "fisher", palette = "BuGn", alpha = 0.8, title = "kelp") +
  # 
  # tm_shape(depth_raster) +
  # tm_raster(style = "fisher", palette = "Blues", alpha = 0.8, title = "depth") +
  # 
  # tm_shape(sst_raster) +
  # tm_raster(style = "fisher", palette = "YlOrRd", alpha = 0.8, title = "SST") +
  # 
  # tm_shape(NO3_raster) +
  # tm_raster(style = "fisher", palette = "BuPu", alpha = 0.8, title = "NO3") +
  # 
  # tm_shape(NO2_raster) +
  # tm_raster(style = "fisher", palette = "Greys", alpha = 0.8, title = "NO2") +
  # 
  # tm_shape(NH4_raster) +
  # tm_raster(style = "fisher", palette = "PuRd", alpha = 0.8, title = "NH4") +
  
  tm_legend(title = "kelpGeoMod") +
  tm_scale_bar(position = c("left", "bottom"), text.size = 0.7) +
  tm_view(set.view = c(-120, 34.1, 8))

tmap_mode("view")
map


