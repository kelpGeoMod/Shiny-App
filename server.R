server <- function(input, output) {
  
  # select input 1 time-series
  # filter for column desired
  time_filtered_df_1 <- reactive({
    kelp_df %>%
    dplyr::select(date, input$time_series_input_1) %>%
    rename(variable = input$time_series_input_1)
  })
  
  # plot the time-series
  output$time_series_output_1 <- renderPlot({
  ggplot(data = time_filtered_df_1(), aes(x = time_filtered_df_1()$date, y = time_filtered_df_1()$variable)) +
    geom_line(color = "darkolivegreen") + 
    theme_classic() +
    labs(title = "Variable 1 Time Series",
         subtitle = "Santa Barbara Channel",
         x = "Date",
         y = "First Variable of Interest",
         caption = "data source: LTER")
  })
  
  
  # select input 2 time-series
  # filter for column desired
  time_filtered_df_2 <- reactive({
    kelp_df %>%
      dplyr::select(date, input$time_series_input_2) %>%
      rename(variable = input$time_series_input_2)
  })
  
  # plot the time-series
  output$time_series_output_2 <- renderPlot({
    ggplot(data = time_filtered_df_2(), aes(x = time_filtered_df_2()$date, y = time_filtered_df_2()$variable)) +
      geom_line(color = "darkblue") + 
      theme_classic() +
      labs(title = "Variable 2 Time Series",
           subtitle = "Santa Barbara Channel",
           x = "Date",
           y = "Second Variable of Interest",
           caption = "data source: LTER")
  })
  
  
  # select input 3 time-series
  # filter for column desired
  time_filtered_df_3 <- reactive({
    kelp_df %>%
      dplyr::select(date, input$time_series_input_3) %>%
      rename(variable = input$time_series_input_3)
  })
  
  # plot the time-series
  output$time_series_output_3 <- renderPlot({
    ggplot(data = time_filtered_df_3(), aes(x = time_filtered_df_3()$date, y = time_filtered_df_3()$variable)) +
      geom_line(color = "darkblue") + 
      theme_classic() +
      labs(title = "Variable 3 Time Series",
           subtitle = "Santa Barbara Channel",
           x = "Date",
           y = "Third Variable of Interest",
           caption = "data source: LTER")
  })
  
  
  # filter map data
  map_filtered_df <- reactive({
    raster(here::here("demo_rasters", paste0(input$map_input_var, ".tiff")))
  })
  
  output$map_output <- renderTmap({
  map <- tm_shape(World) +
    tm_polygons() +
    
    tm_shape(channel_islands) +
    tm_polygons() +
    
    tm_shape(area_sf) +
    tm_borders(lwd = 1, col = "red") +
    
    tm_shape(map_filtered_df()) +
    tm_raster(style = "fisher", palette = "YlOrRd", alpha = 0.8, title = "Variable of interest") +
    
    tm_legend(title = "kelpGeoMod") +
    tm_scale_bar(position = c("left", "bottom"), text.size = 0.7) +
    tm_view(set.view = c(-120, 34.1, 8))
  
  tmap_mode("view")
  map
  })
  
  # filter data table
  dt_filtered_df <- reactive({
    kelp_df %>%
      rename(kelp_raster = kelp_biomass,
             depth_raster = depth,
             sst_raster = sst,
             NO3_raster = NO3,
             NO2_raster = NO2,
             NH4_raster = NH4) %>%
      dplyr::select(latitude, longitude, year, quarter, input$map_input)
  })
  
  output$dt_output <- renderDataTable({
    dt_filtered_df()
  })
  
  
  # filter model data
  model_filtered_df <- reactive({
    raster(here::here("demo_rasters", paste0(input$model_input, ".tiff")))
  })
  
  output$model_output <- renderTmap({
    model <- tm_shape(World) +
      tm_polygons() +
      
      tm_shape(channel_islands) +
      tm_polygons()+
      
      tm_shape(area_sf) +
      tm_borders(lwd = 1, col = "red") +
      
      tm_shape(model_filtered_df()) +
      tm_raster(style = "fisher", palette = "Spectral", alpha = 0.8, title = "Model of Choice") +
      
      tm_legend(title = "Model Results") +
      tm_scale_bar(position = c("left", "bottom"), text.size = 0.7) +
      tm_view(set.view = c(-120, 34.1, 8))
    
    tmap_mode("view")
    model
  })
  
  # # filter lake data ----
  # filtered_lakes <- reactive ({
  # 
  #   lake_data |>
  #     filter(Elevation >= input$elevation_slider_input[1] & Elevation <= input$elevation_slider_input[2]) |>
  #     filter(AvgDepth >= input$depth_slider_input[1] & AvgDepth <= input$depth_slider_input[2]) |>
  #     filter(AvgTemp >= input$temp_slider_input[1] & AvgTemp <= input$temp_slider_input[2])
  # 
  # })
  # 
  # 
  # 
  # # build leaflet map ----
  # output$lake_map <- renderLeaflet({
  # 
  #   leaflet() |>
  # 
  #     # add tiles
  #     addProviderTiles("Esri.WorldImagery") |>
  # 
  #     # set view over AK
  #     setView(lng = -152.048442, lat = 70.249234, zoom = 6) |>
  # 
  #     # add mini map
  #     addMiniMap(toggleDisplay = TRUE, minimized = TRUE) |>
  # 
  #     # add markers
  #     addMarkers(data =  filtered_lakes(),
  #                lng = filtered_lakes()$Longitude, lat = filtered_lakes()$Latitude,
  #                popup = paste("Site Name:", filtered_lakes()$Site, "<br>",
  #                              "Elevation:", filtered_lakes()$Elevation, "meters (above SL)", "<br>",
  #                              "Avg Depth:", filtered_lakes()$AvgDepth, "meters", "<br>",
  #                              "Avg Lake Bed Temperature:", filtered_lakes()$AvgTemp, "deg Celsius"))
  # 
  # })
  # 
  # 
  # 
}