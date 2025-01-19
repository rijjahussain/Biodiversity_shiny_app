animal_filter_server <- function(id, input_data) {
  moduleServer(id, function(input, output, session) {
    observe({
      valid_choices <- unique(c(input_data$scientificName, input_data$vernacularName))
      updateSelectizeInput(
        session,
        "animal",
        choices = valid_choices,
        selected = NULL
      )
    })
    # Reactive expression to filter data based on user input
    filtered_data <- reactive({
      if (is.null(input$animal) || input$animal == "" || length(input$animal) == 0) {
        return(input_data)  # Return all rows if no animal is selected
      }
      input_data %>%
        filter(scientificName %in% input$animal | vernacularName %in% input$animal)
    })
    
    return(filtered_data)
  })
}
