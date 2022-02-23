############################################
################ Global.R###################
############################################
# loading data and defining global variables

# Loading libraries
suppressMessages(library("shiny"))
suppressMessages(library("shiny.semantic"))
suppressMessages(library("semantic.dashboard"))
suppressMessages(library("dplyr"))
suppressMessages(library("leaflet"))
suppressMessages(library("feather"))
suppressMessages(library("plotly"))
suppressMessages(library("glue"))
suppressMessages(library("htmltools"))



# Loading data files
data_dir <- "program/data/"
support_dir <- "program/functions/"
module_dir <- "program/modules/"

# sourcing supporting files
source(paste0(support_dir, "support_functions.R"), local = TRUE)
source(paste0(support_dir, "gridTemplate.R"), local = TRUE)

source(paste0(module_dir, "data_filtering_module.R"), local = TRUE)
source(paste0(module_dir, "info_module.R"), local = TRUE)
source(paste0(module_dir, "tsgraph_module.R"), local = TRUE)
source(paste0(module_dir, "map_module.R"), local = TRUE)

# defining global variables and pre-processing data to reduce latency
g_bio_diversity <- read_feather(path = paste0(data_dir,"bio_diversity.feather"))
g_bio_diversity <- get_processed_dataset(g_bio_diversity)