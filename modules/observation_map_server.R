observation_map_server <- function(id, filtered_data) {
  moduleServer(id, function(input, output, session) {
    output$observation_map <- renderLeaflet({
      data <- filtered_data()
      
      # If no data, create an empty map
      if (nrow(data) == 0) {
        leaflet() %>%
          addTiles() %>%
          addMarkers(lng = numeric(0), lat = numeric(0))
      } else {
        leaflet(data) %>%
          addTiles() %>%
          addCircleMarkers(
            lng = ~longitudeDecimal,
            lat = ~latitudeDecimal,
            radius = 5,  # Correct the typo here from 'indivialCount' to 'individualCount'
            color = "blue",
            label = ~paste0(
              "<strong>Scientific Name:</strong> ", scientificName, "<br>",
              "<strong>Common Name:</strong> ", vernacularName, "<br>",
              "<strong>Date:</strong> ", eventDate, "<br>",
              "<strong>Count:</strong> ", individualCount
            ),
            labelOptions = labelOptions(direction = "auto")
          )
      }
    })
  })
}
