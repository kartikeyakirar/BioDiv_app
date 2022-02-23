############################################
######## map_module.R##########
############################################

# UI
species_map_ui <- function(id) {
    ns <- NS(id)
    tagList(
        tags$span(class="dashboard-title", "Species occurrence on Map"),
        leaflet::leafletOutput(ns("time_species"), width = "100%", height = "90%")
    )
}

# Server
species_map_server <- function (input, output, session, diversity_dt) {
    
    output$time_species <- renderLeaflet({
        if(is.null(diversity_dt())) {
            msg <- tags$span("Please select species from drop-down to plot occurrences on map")
            out <-  leaflet() %>%
                addTiles() %>%
                addControl(msg, position = "topleft")
        } else {
            bio_dt <- diversity_dt()
            out <-leaflet(data = bio_dt,
                          options = leafletOptions(minZoom = 0, maxZoom = 12)) %>% addTiles() %>%
                addMarkers( ~ longitudeDecimal, ~ latitudeDecimal,
                            popup =  ~htmlEscape(paste0("<b>Species: </b>", scientificName," {<em>", vernacularName,"</em>}",
                                                        "<br><b>Occurrences: </b>", individualCount,
                                                        "<br><b>Locality: </b>", locality)))
        }
        out
    })
}

