# This is shiny web application built using shiny.semantics, plotly and leflet package
# Developer: Kartikeya kirar
# Date: 23-02-2022

############################################
######### loading UI and SERVER files ######
############################################

source(paste("program", "global.R", sep = .Platform$file.sep), local = TRUE)
source(paste("program", "server_local.R", sep = .Platform$file.sep), local = TRUE)
source(paste("program", "ui_local.R", sep = .Platform$file.sep), local = TRUE)

############################################
######## Load application ##################
############################################

shiny::shinyApp(ui, server)