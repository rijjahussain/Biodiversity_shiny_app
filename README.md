
# Shiny App - Biodiversity Dashboard

This Shiny app displays a biodiversity dashboard with data on various species in Poland.

## Requirements

To run this app locally, you need the following R packages:
- shiny
- dplyr
- DT
- ggplot2
- leaflet

## How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/your-repository-name.git
# Biodiversity Dashboard

This Shiny app allows users to explore biodiversity data in Poland, visualize observation trends over time, and view observation locations on a map. It includes a dynamic filter for species selection, a table for displaying filtered data, a plot for the observation timeline, and an interactive map for showing observation locations.

## Features
- **Animal Filter**: Allows users to filter species based on scientific or common names.
- **Data Table**: Displays the filtered data in a table format with basic information on each observation.
- **Observation Timeline**: Plots the total number of observations over time for the selected species.
- **Observation Map**: Shows the locations of observations on an interactive map with markers indicating where the species were observed.

## Folder Structure

app.R
modules/
animal_filter_ui.R
animal_filter_server.R
filtered_table_ui.R
filtered_table_server.R
timeline_plot_ui.R
timeline_plot_server.R
observation_map_ui.R
observation_map_server.R
data/
poland.rds

### Explanation of the Folder Structure:
1. **app.R**: The main file that ties together the UI and server components of the app, loading the modules and running the app.
2. **modules/**: Contains R scripts for each module. Modules separate the different functionalities of the app, making it easier to maintain and extend.
    - `animal_filter_ui.R`: Defines the UI for the animal filter input.
    - `animal_filter_server.R`: Contains the server logic for filtering data based on user input.
    - `filtered_table_ui.R`: Contains the UI for displaying the filtered data table.
    - `filtered_table_server.R`: Contains the server logic to render the filtered data table.
    - `timeline_plot_ui.R`: Defines the UI for the observation timeline plot.
    - `timeline_plot_server.R`: Contains the server logic for generating the timeline plot.
    - `observation_map_ui.R`: Contains the UI for the observation map.
    - `observation_map_server.R`: Contains the server logic for rendering the map.
3. **data/**: Contains the `poland.rds` file, which holds the biodiversity observation data.

## Installation

To run this app locally, follow the steps below:

1. **Install Required Packages**:

   Install the required R packages by running the following commands in your R console:

   ```r
   install.packages(c("shiny", "dplyr", "DT", "ggplot2", "leaflet"))
Download the Data:

Ensure that the poland.rds file is located in the data/ folder within the project directory. This file contains the dataset used by the app.

Run the App:

In your R console, set the working directory to the folder containing app.R and run:

shiny::runApp("app.R")
Access the App:

Once the app starts, it will open in your default web browser, and you will be able to interact with the app.

## Modules
1. Animal Filter Module:
UI: A selectizeInput to filter observations by scientific or vernacular (common) name.
Server: A reactive expression filters the data based on the user's selection.


2. Filtered Data Table Module:
UI: A DT::dataTableOutput to display the filtered data.
Server: Renders the table with the filtered data, showing key fields like scientific name, vernacular name, event date, individual count, latitude, and longitude.


3. Observation Timeline Module:
UI: A plotOutput for displaying a timeline plot.
Server: Creates a time-series plot showing the total count of observations per date, allowing users to visualize observation trends.


4. Observation Map Module:
UI: A leafletOutput to display the observation locations on an interactive map.
Server: Uses Leaflet to render a map with addCircleMarkers for each observation. The map is updated dynamically based on the filtered data.
### App Flow
User interacts with the Animal Filter: The user selects a species from the filter, and the app reacts by displaying the filtered data.


Filtered Data Table: Once a species is selected, the filtered data table is updated with observations matching the species.


Observation Timeline: The app will generate a timeline plot based on the selected species, showing the total number of observations over time.


Observation Map: Finally, the observation map will be updated with markers indicating the geographical locations of the observations.




License
This project is licensed under the MIT License.
