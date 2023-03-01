# dashboard header -------------------------
header <- dashboardHeader(
  
  title = "kelpGeoMod",
  titleWidth = 230
  
) # END dashboardHeader

# dashboard sidebar  -------------------------
sidebar <- dashboardSidebar(
  
  sidebarMenu(
    
    menuItem(text = "Introduction", tabName = "introduction", icon = icon("star")),
    menuItem(text = "Data Visualizations", tabName = "data_visulizations", icon = icon("gauge"), startExpanded = TRUE,
                      menuSubItem('Map',
                               tabName = 'map',
                               icon = icon('line-chart')),
                      menuSubItem('Time-series',
                               tabName = 'time_series',
                               icon = icon('line-chart')),
                      menuSubItem('Model',
                               tabName = 'model',
                               icon = icon('line-chart'))),
    menuItem(text = "User guide", tabName = "user_guide", icon = icon("gauge")),
    menuItem(text = "Metadata", tabName = "metadata", icon = icon("gauge")),
    menuItem(text = "Limitations", tabName = "limitations", icon = icon("gauge")),
    menuItem(text = "References", tabName = "references", icon = icon("gauge"))
    
  ) # END sidebarMenu
  
) # END dashboardSidebar

# dashboard body  -------------------------
body <- dashboardBody(
  
  # set theme ----
  #fresh::use_theme("fresh_theme.css"),
  
  # tabItems -----
  tabItems(
    
    # intro tabItem ----
    tabItem(tabName = "introduction",
            
            # left-hand column
            column(width = 6,
                   
                   # left-box
                   box(width = NULL,
                       
                       title = tagList(icon("water"), tags$strong("Kelp Forest Abundance & Oceanographic Factors in the SBC")),
                       includeMarkdown("text/intro_left.md"),
                       tags$img(src = "kelp.jpg", 
                                alt = "A kelp forest with Ocean Rainforest and UCSB logos over it.",
                                style = "max-width: 100%;"),
                       #tags$h6(tags$em("Image Source:", tags$a(href = "http://www.fishcreekwatershed.org", "?")),
                               style = "text-align: center;"
                       
                       ) # END left-box
                   
                   ), # END left-column
            
            # right-hand column
            column(width = 6,
                   
                   # top fluidRow ----
                   fluidRow(
                     
                      box(width = NULL,
                       
                          title = tagList(icon("water"), tags$strong("Information")),
                          includeMarkdown("text/intro_right.md")
                       
                   ) # END box
                   
                ), # END top fluidRow
                
                # # bottom fluidRow ----
                # fluidRow(
                #   
                #   box(width = NULL,
                #       
                #       title = tagList(icon("water"), tags$strong("Disclaimer")),
                #       includeMarkdown("text/disclaimer.md")
                #       
                #   ) # END box 2
                #   
                # ) # END bottom fluidRow
                
            ) # END right-column
            
            ), # END intro tabItem
    
    # map tabItem ----
    tabItem(tabName = "map",
            "Insert map stuff here"
            # # fluidRow ----
            # fluidRow(
            #   
            #   # input box ----
            #   box(width = 4,
            #       
            #       title = tags$strong("Adjust lake parameter ranges:"),
            #       
            #       # sliderInputs ----
            #       sliderInput(
            #         inputId = "elevation_slider_input", 
            #         label = "Elevation (meters above SL):",
            #         min = min(lake_data$Elevation), max = max(lake_data$Elevation),
            #         value = c(min(lake_data$Elevation), max(lake_data$Elevation))
            #         ), # END sliderInput 1
            #       
            #       sliderInput(
            #         inputId = "depth_slider_input", label = "Average depth (meters):",
            #         min = min(lake_data$AvgDepth), max = max(lake_data$AvgDepth),
            #         value = c(min(lake_data$AvgDepth), max(lake_data$AvgDepth))
            #         ), # END sliderInput 2
            #       
            #       sliderInput(
            #         inputId = "temp_slider_input", label = "Average lake bed temperature (degrees C):",
            #         min = min(lake_data$AvgTemp), max = max(lake_data$AvgTemp),
            #         value = c(min(lake_data$AvgTemp), max(lake_data$AvgTemp))
            #         ) # END sliderInput 3
            #       
            #       ), # END input box
            #   
            #   # leaflet box ----
            #   box(width = 8,
            #       
            #       title = tags$strong("Monitored lakes within Fish Creek Watershed:"),
            #       
            #       # leaflet output ----
            #       leafletOutput(outputId = "lake_map") |> withSpinner(type = 1, color = "#742361")
            #       
            #   ), # END leaflet box
            #   
            # ) # END fluidRow
            
    ), # END map tabItem
    
    # user guide tabItem ----
    tabItem(tabName = "user_guide",
            
            "Insert user guide stuff here"
            
    ), # END user guide tabItem
    
    # time-series tabItem ----
    tabItem(tabName = "time_series",
            
            "Insert time-series stuff here"
            
    ), # END time-series tabItem
    
    # model tabItem ----
    tabItem(tabName = "model",
            
            "Insert model stuff here"
            
    ), # END model tabItem
    
    # metadata tabItem ----
    tabItem(tabName = "metadata",
            
            "Insert metadata stuff here"
            
    ), # END metadata tabItem
    
    # limitations tabItem ----
    tabItem(tabName = "limitations",
            
            "Insert limitations stuff here"
            
    ), # END limitations tabItem
    
    # references tabItem ----
    tabItem(tabName = "references",
            
            "Insert references stuff here"
            
    ) # END references tabItem
    
  ) # END tabItems
  
) # END dashboardBody

# combine all  -------------------------
dashboardPage(header, sidebar, body)