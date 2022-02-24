############################################
######## data_filtering_module.R##########
############################################

# UI
species_selection_ui <- function(id) {
    ns <- NS(id)
    tagList(selectizeInput(inputId = ns("sel_species"),
                           label = "Select species",
                           choices = NULL,
                           multiple = FALSE,
                           width = "100%")
    )
}

# Server
species_selection_server <- function (input, output, session, dataset) {
    param <- reactiveVal()
    choice_dataset <- get_choice_dataset(dataset)
    updateSelectizeInput(session = session,
                         inputId = "sel_species",
                         choices = choice_dataset,
                         selected = "",
                         server = T,
                         options = list(valueField = 'value',
                                        labelField = 'value',
                                        searchField = c('label1', 'label2'),
                                        create = FALSE,render = I(
                                            "{
            option: function(item, escape) {
            return '<div>' +
               '<b> scientificName </b>' + escape(item.label1) + '<br>' +
               ' <em>{<b>vernacularName:</b> ' + escape(item.label2) + '}</em>' +
               '</div>';
               },
               item: function(item, escape) { return '<div>' +
               ' <span>' + escape(item.label1) + '</span>' +
               ' <em>{' + escape(item.label2) + '}</em>' +
               '</div>';}
             }"
                                        )))
    
    observeEvent(input$sel_species, {
        dat <- NULL
        if (!is.null(input$sel_species) && input$sel_species != "") {
            dat = g_bio_diversity %>%
                filter(searchName == input$sel_species)
        }
        param(dat)
    })
    
    return(param)
}
