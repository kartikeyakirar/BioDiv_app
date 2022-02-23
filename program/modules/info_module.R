############################################
######## info_module.R##########
############################################

# UI
species_info_ui <- function(id) {
    ns <- NS(id)
    tagList(grid(grid_template = vboxGrid,
                 area_styles = list(info1 = "padding: 5px",info2 = "padding: 5px",info3 = "padding: 5px"),
                 info1 = card(div(class = "content card_cls",
                              valueBoxOutput(ns("species_info")))),
                 info2 = card(div(class = "content card_cls",
                              valueBoxOutput(ns("taxonomy_info")))),
                 info3 = card(div(class = "content card_cls",
                              valueBoxOutput(ns("geo_info"))))
    ))
}

# Server
species_info_server <- function (input, output, session, diversity_dt) {
    
    output$species_info <- renderValueBox({
        bio_dt <- diversity_dt()
        # Extracting species info from dataset.
        kingdom <- unique(bio_dt$kingdom)
        family <- unique(bio_dt$family)
        info_text <- HTML(glue("<div class='info_cls'><span><b>Kingdom:</b>{kingdom}</span><br><span><b>Family:</b>{family}</span></div>"))
        
        valueBox(value = div("Species", icon("paw")),
                 subtitle = info_text)
    })
    
    output$taxonomy_info<- renderValueBox({
        bio_dt <- diversity_dt()
        # Extracting species taxonomy info from dataset.
        s_name <- unique(bio_dt$scientificName)
        v_name <- unique(bio_dt$vernacularName)
        info_text <- HTML(glue("<div class='info_cls'><span><b>Scientific Name:</b>{s_name}</span><br><span><b>Vernacular Name:</b>{v_name}</span></div>"))
        
        valueBox(value = div("Taxonomy", icon("list")),
                 subtitle = info_text)
    })
    
    output$geo_info <- renderValueBox({
        bio_dt <- diversity_dt()
        # Extracting species geographical  info from dataset.
        countinent_name <- unique(bio_dt$continent)
        country_name <- unique(bio_dt$country)
        locals_name <- paste0(unique(bio_dt$locality),collapse = ", ")
        info_text <- HTML(glue("<div class='info_cls'><span><b>Countinent:</b>{countinent_name}</span><br><span><b>Country:</b>{country_name}</span><br><span><b>Locality:</b>{locals_name}</span></div>"))
        
        valueBox(value = div("Geographic", icon("map marked")),
                 subtitle = info_text)
    })
}
