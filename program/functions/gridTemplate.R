########################################
############ app grid###################
########################################

# application grid
appGrid <- grid_template(
    default = list(areas = rbind(c("tsgraph", "title"),
                                 c("tsgraph", "panel"),
                                 c("map", "panel"),
                                 c("map", "info")),
                   cols_width = c("1fr", "400px"),
                   rows_height = c("50px", "200px", "auto", "20%")),
    mobile = list(areas = rbind("title",
                                "panel",
                                "info",
                                "map",
                                "tsgraph"),
                  rows_height = c("50px", "auto", "100px", "300px", "100px"),
                  cols_width = c("100%"))
)

# sidepanel grid
panelGrid <- grid_template(
    default = list(areas = rbind(c("text", "text"),
                                 c("widget", "widget"),
                                 c("info_box", "info_box")),
                   cols_width = c("50%", "50%"),
                   rows_height = c("100px", "150px", "auto")
    ))

# valuebox grid
vboxGrid <- grid_template(
    default = list(areas = rbind(c("info1"),
                                 c("info2"),
                                 c("info3")),
                   cols_width = c("100%"),
                   rows_height = c("150px","150px","150px")
    ))
