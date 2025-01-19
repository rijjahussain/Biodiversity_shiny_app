required_packages <- c("shiny", "dplyr", "DT", "ggplot2", "leaflet")

# Check if packages are installed
missing_packages <- required_packages[!(required_packages %in% installed.packages()[, "Package"])]
if(length(missing_packages)) {
  install.packages(missing_packages)  # Install missing packages
}

# Load the libraries
lapply(required_packages, library, character.only = TRUE)


library(dplyr)
library(DT)
library(ggplot2)
library(leaflet)
library(shiny)
library(shinydashboard)


source("modules/animal_filter_ui.R")
source("modules/animal_filter_server.R")
source("modules/filtered_table_ui.R")
source("modules/filtered_table_server.R")
source("modules/timeline_plot_ui.R")
source("modules/timeline_plot_server.R")
source("modules/observation_map_ui.R")
source("modules/observation_map_server.R")

ui <- fluidPage(
  titlePanel("Biodiversity Dashboard"),
  
  # Call the animal filter module
  animal_filter_ui("animal_filter"),
  
  # Call the filtered data table module
  filtered_table_ui("filtered_table"),
  
  # Call the timeline plot module
  timeline_plot_ui("timeline_plot"),
  
  # Call the observation map module
  observation_map_ui("observation_map")
)
server <- function(input, output, session) {
  # Load the dataset
  input_data <- readRDS("data/poland.rds")
  
  # Call the animal filter module and get the filtered data
  filtered_data <- animal_filter_server("animal_filter", input_data)
  
  # Call the filtered data table module
  filtered_table_server("filtered_table", filtered_data)
  
  # Call the timeline plot module
  timeline_plot_server("timeline_plot", filtered_data)
  
  # Call the observation map module
  observation_map_server("observation_map", filtered_data)
}


shinyApp(ui = ui, server = server)
