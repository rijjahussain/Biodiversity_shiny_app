animal_filter_ui <- function(id) {
  ns <- NS(id)  # Create a namespace for the module
  selectizeInput(
    ns("animal"),
    "Animal Filter",
    choices = NULL,
    multiple = FALSE,
    selected = NULL,
    options = list(placeholder = "Select a species or common name")
  )
}