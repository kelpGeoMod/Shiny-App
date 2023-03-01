

library(tidyverse)

#Import the Data Frame
kelp_df <- readRDS(here::here("demo_rasters", "kelp_df.rds"))




### 4. Print the variables as time series graphs
#a)  In the same plot

colors <- c("darkgreen", "#56B4E9", "orange", "purple", "#0072B2", "#D55E00")
y_vars <- c("kelp_biomass", "depth", "sst", "NO3", "NO2", "NH4")

# Create a plot for each variable with a buffer of 10% of the data range
plot_list <- lapply(seq_along(colors), function(i) {
  var <- y_vars[i]
  y_range <- range(kelp_df[[var]])
  buffer <- diff(y_range) * 0.2
  ggplot(kelp_df, aes(x = date, y = !!sym(var))) +
    geom_line(color = colors[i]) +
    labs(x = "Date", y = var) +
    ylim(y_range + c(-buffer, buffer))
})

# Combine the plots into a single figure using facet_wrap
do.call(gridExtra::grid.arrange, c(plot_list, ncol = 2))


#b)  Print them in six different graphs
# Create a for loop to generate a separate ggplot for each y variable

for (i in seq_along(y_vars)) {
  
  # Create the ggplot
  final_plots <- ggplot(kelp_df, aes(x = date, y = !!sym(y_vars[i]))) +
    geom_line(color = colors[i]) +
    labs(title = y_vars[i], y = y_vars[i], x = "Date")
  
  # Print the ggplot
  print(final_plots)
  
}
