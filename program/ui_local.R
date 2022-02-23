########################################
############ ui_local.R#################
########################################

# File contains ui layout and widgets

ui = semanticPage(includeCSS("program/www/style.css"),
                  grid(grid_template = appGrid,
                       area_style = list(title = "margin: 20px;", panel = "margin: 20px;", info = "margin: 20px;"),
                       title = h2(class = "ui header", icon("globe"), div(class = "content", "BioDiversity app")),
                       panel = uiOutput("panelElements"),
                       map = species_map_ui("map_species"),
                       tsgraph = species_tsgraph_ui("ts_species"),
                       info = div(h4(class="ui horizontal divider header",icon("info circle"), "@about"),
                                  div(class = "ui segment", style = "margin-bottom: 10px","This application is developed by ",br(),
                                  tags$img(src = "/www/developer.png", class = "ui avatar image"),
                                  a(herf = "https://www.linkedin.com/in/kartikeyakirar/", "Kartikey kirar"),
                                  " as part of appsilon assignment. It's built using shiny.semantic, plotly and leaflet pacakge"))
))