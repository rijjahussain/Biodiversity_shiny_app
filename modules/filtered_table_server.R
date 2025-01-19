filtered_table_server <- function(id, filtered_data) {
  moduleServer(id, function(input, output, session) {
    output$filtered_table <- renderDT({
      data <- filtered_data()
      datatable(
        data %>%
          select(
            scientificName,
            vernacularName,
            eventDate,
            individualCount,
            latitudeDecimal,
            longitudeDecimal
          ),
        options = list(
          pageLength = 10,
          autoWidth = FALSE,
          scrollX = TRUE,
          columnDefs = list(
            list(targets = 0, width = '20%', className = 'dt-center'),
            list(targets = 1, width = '20%', className = 'dt-center'),
            list(targets = 2, width = '20%', className = 'dt-center')
          )
        ),
        rownames = FALSE
      )
    })
    })
}
