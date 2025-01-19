filtered_table_ui <- function(id) {
  ns <- NS(id)  # Create a namespace for the module
  DTOutput(ns("filtered_table"))
}