############################################
################ supporting_functions.R#####
############################################
suppressMessages(library(hms))
suppressMessages(library(lubridate))

# Function to create timestamp for occurance
get_time_stamp <- function(dataset) {
    dataset$eventTime[is.na(dataset$eventTime)]<-hms::new_hms(x = numeric(1))
    return(ymd_hms(paste(dataset$eventDate, dataset$eventTime)))
}

# Function to create choice data.frame for user
get_choice_dataset <- function(dataset) {

    if(!("searchName" %in% colnames(dataset))) {
        warning("dataset is not processed for mapping based on user input")   
    }
    
    choice_dt <- tibble(value  = dataset$searchName, 
                        label1 = dataset$scientificName,
                        label2 = dataset$vernacularName) %>% 
        distinct()
    
    return(choice_dt)
}

# Function Update the diversity dataset for further analysis
get_processed_dataset <- function(dataset) {
    try({
        # get timestamp for occurance
        dataset$dateTime <- get_time_stamp(dataset)
        
        # create searchable name by combining the scientificname and vernacularname
        dataset$scientificName[is.na(dataset$scientificName)]= ""
        dataset$vernacularName[is.na(dataset$vernacularName)] = ""
        dataset$searchName = paste(dataset$scientificName, dataset$vernacularName,sep = "|")
        
        # subset dataset for required columns
        dataset <- dataset %>% select(c(scientificName, kingdom, family, vernacularName, individualCount, lifeStage,
                                        sex, longitudeDecimal, latitudeDecimal, continent, country, stateProvince,
                                        locality, eventDate, eventTime, dateTime, searchName))
        
        return(dataset)
    })
}

# Function creates empty plot for display
empty_plotly <- function(title = NULL){
    plotly_empty(type = "scatter", mode = "markers") %>%
        config(displayModeBar = FALSE) %>%
        layout(title = list(text = title,
                            yref = "paper",
                            y = 0.5))
} 
