############################################
######## tsgraph_module.R##########
############################################

# UI
species_tsgraph_ui <- function(id) {
    ns <- NS(id)
    tagList(
        tags$span(class="dashboard-title", "TS-Graph"),
        plotly::plotlyOutput(outputId = ns("time_species"),
                                 width = "100%",
                                 height = "200px")
    )
}

# Server
species_tsgraph_server <- function (input, output, session, diversity_dt) {
    
    output$time_species <- renderPlotly({
        if(is.null(diversity_dt())) {
            out <-  empty_plotly("Select species to analyse time series occurrence.")
        } else {
            bio_dt <- diversity_dt() %>%
                dplyr::arrange(dateTime)
            out <- plot_ly(data = bio_dt, type = 'scatter', mode = 'lines+markers', fill = 'tozeroy' )%>%
                add_trace(x = ~dateTime, y = ~individualCount, 
                          text = ~paste('<b>Species:</b> ', scientificName,
                                        '</br><b> Locality:</b> ', locality),
                          fillcolor = 'rgba(168, 216, 234, 0.5)',
                          hoveron = 'points',
                          hoverinfo = 'text',
                          marker = list(color = 'darkorange'),
                          line = list(color = 'darkorange'),
                          hovertemplate = paste0("%{text}<br>","<br><b>Occurrence:</b> %{y}<extra></extra>")) %>%
                layout(showlegend = F, 
                       yaxis = list(zerolinecolor = '#ffff',
                                    zerolinewidth = 2,
                                    gridcolor = 'ffff'),
                       xaxis = list(zerolinecolor = '#ffff',
                                    zerolinewidth = 2,
                                    gridcolor = 'ffff'),
                       plot_bgcolor='#E6E6E9') %>%
                layout(showlegend = F,
                       xaxis = list(title = 'Time line'), 
                       yaxis = list(title = 'Occurrence'))
        }
        
        out
    })
}
