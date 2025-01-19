timeline_plot_server <- function(id, filtered_data) {
  moduleServer(id, function(input, output, session) {
    output$timeline_plot <- renderPlot({
      data <- filtered_data()
      
      if (nrow(data) == 0) {
        ggplot() +
          labs(
            title = "No Data Available",
            x = "Date",
            y = "Total Observations"
          )
      } else {
        plot_data <- data %>%
          group_by(eventDate) %>%
          summarise(total_count = sum(individualCount, na.rm = TRUE))
        
        ggplot(plot_data, aes(x = as.Date(eventDate), y = total_count)) +
          geom_line(color = "blue") +
          labs(
            title = paste("Timeline of Observations for:", paste(input$animal, collapse = ", ")),
            x = "Date",
            y = "Total Observations"
          ) +
          theme_minimal()
      }
    })
  })
}
