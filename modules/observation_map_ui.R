observation_map_ui <- function(id) {
  ns <- NS(id)  # Create a namespace for the module
  leafletOutput(ns("observation_map"), height = 500)
}