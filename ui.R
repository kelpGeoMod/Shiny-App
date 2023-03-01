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
                       #tags$img(src = here::here("www", "kelp.jpg"), 
                                #alt = "A kelp forest with Ocean Rainforest and UCSB logos over it.",
                               # style = "max-width: 100%;"),
                       #tags$h6(tags$em("Image Source:", tags$a(href = "http://www.fishcreekwatershed.org", "?")),
                       #style = "text-align: center;"
                       
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
            
            # fluidRow ----
            fluidRow(
              
              # input box ----
              box(width = 4,
                  
                  title = tags$strong("Select what variable you'd like to view on a map."),
                  
                  # select input 1----
                  radioButtons(inputId = "map_input_var", label = h3("Variable options for mapping:"), 
                              choices = list("Biomass" = "kelp_raster", 
                                             "Ocean depth" = "depth_raster", 
                                             "Sea surface temperature" = "sst_raster",
                                             "NO3" = "NO3_raster",
                                             "NO2" = "NO2_raster",
                                             "NH4" = "NH4_raster")
                  ), # END select input 1
                  
              ), # END input box
              
              # map & datatable box ----
              box(width = 8,
                  
                  title = tags$strong("Gridded values for variable of interest on a map:"),
                  
                  # tmap & datatable output ----
                  tmapOutput(outputId = "map_output") |> withSpinner(type = 1, color = "#742361"),
                  dataTableOutput(outputId = "dt_output") |> withSpinner(type = 1, color = "#742361")
                  
              ), # END map & datatable box
              
            ), # END fluidRow
            
    ), # END map tabItem
    
    # time-series tabItem ----
    tabItem(tabName = "time_series",
            
            # fluidRow ----
            fluidRow(
              
              # input box ----
              box(width = 4,
                  
                  title = tags$strong("Select which variables you would like to see a time-series for (up to 3)."),
                  
                  # select input 1----
                  selectInput(inputId = "time_series_input_1", label = h3("Variable options for time-series 1:"), 
                              choices = list("Biomass" = "kelp_biomass", 
                                             "Ocean depth" = "depth", 
                                             "Sea surface temperature" = "sst",
                                             "NO3" = "NO3",
                                             "NO2" = "NO2",
                                             "NH4" = "NH4")
                              ), # END select input 1
              
                   # select input 2----
                  selectInput(inputId = "time_series_input_2", label = h3("Variable options for time-series 2:"), 
                              choices = list("Biomass" = "kelp_biomass", 
                                             "Ocean depth" = "depth", 
                                             "Sea surface temperature" = "sst",
                                             "NO3" = "NO3",
                                             "NO2" = "NO2",
                                             "NH4" = "NH4")
                              ), # END select input 2
            
                  # select input 3----
                  selectInput(inputId = "time_series_input_3", label = h3("Variable options for time-series 3:"), 
                              choices = list("Biomass" = "kelp_biomass", 
                                             "Ocean depth" = "depth", 
                                             "Sea surface temperature" = "sst",
                                             "NO3" = "NO3",
                                             "NO2" = "NO2",
                                             "NH4" = "NH4")
                             ) # END select input 3
            
            ), # END input box
                  
                  # graph box ----
                  box(width = 8,
                      
                      title = tags$strong("Values of the variables of interest over the time period:"),
                      
                      # graph output ----
                      plotOutput(outputId = "time_series_output_1"), #|> withSpinner(type = 1, color = "#742361")
                      plotOutput(outputId = "time_series_output_2"),
                      plotOutput(outputId = "time_series_output_3")
                  ), # END graph box
                  
              ), # END fluidRow
              
            ), # END time-series tabItem
            
            # model tabItem ----
            tabItem(tabName = "model",
                    
                    # fluidRow ----
                    fluidRow(
                      
                      # input box ----
                      box(width = 4,
                          
                          title = tags$strong("Select which model you'd like to view on a map."),
                          
                          # select input 1----
                          radioButtons(inputId = "model_input", label = h3("Model options for mapping:"), 
                                       choices = list("Restoration" = "resto_model_raster", 
                                                      "Cultivation" = "harvest_model_raster")
                          ), # END select input 1
                          
                      ), # END input box
                      
                      # model box ----
                      box(width = 8,
                          
                          title = tags$strong("Estimated kelp presence probability for selected model on a map:"),
                          
                          # tmap output ----
                          tmapOutput(outputId = "model_output") |> withSpinner(type = 1, color = "#742361")
                      ), # END model box
                      
                    ), # END fluidRow
                    
            ), # END model tabItem
            
            # user guide tabItem ----
            tabItem(tabName = "user_guide",
                    
                    "Insert user guide stuff here"
                    
            ), # END user guide tabItem
            
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