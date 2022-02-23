########################################
############ server_local.R#############
########################################

server <- function(input, output, session) {
    
    app_param <- reactiveValues()
    app_param$filter_dataset <- NULL
    
    # Modules
    app_param$filter_dataset <- callModule(species_selection_server, "shipSelection", g_bio_diversity)
    callModule(species_info_server, "diversity_info", reactive({app_param$filter_dataset()}))
    callModule(species_tsgraph_server, "ts_species", reactive({app_param$filter_dataset()}))
    callModule(species_map_server, "map_species", reactive({app_param$filter_dataset()}))
    
    # rendering functions
    output$panelElements <- renderUI({
        grid(grid_template = panelGrid,
             area_styles = list(text = "padding: 10px", widget = "padding:10px; margin: 5px", info_box = "padding: 10px"),
             text = div(class = "ui segment",p("App plots species occurrence on map and build the timeline for species spotted.")),
             widget = species_selection_ui("shipSelection"),
             info_box = species_info_ui("diversity_info")
        )
    })
}
