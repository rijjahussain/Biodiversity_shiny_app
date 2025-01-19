timeline_plot_ui <- function(id) {
  ns <- NS(id)  # Create a namespace for the module
  plotOutput(ns("timeline_plot"))
}