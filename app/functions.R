library(data.table)

data_versions_lists <- function() { 
  files_available <- list.files('data/')
  file_list <- list()
  for (file in files_available) {
    file_split <- strsplit(file, "_")[[1]]
    hes_efu <- paste0(file_split[2], ", ", file_split[3])
    year <- paste0("20", substr(file_split[4], 3, 4))
    file_list[[hes_efu]] <- c(file_list[[hes_efu]], file)
    names(file_list[[hes_efu]])[length(file_list[[hes_efu]])] <- year
  }
  return(file_list)
}



get_hes <- function(filename) {
  filename_split <- strsplit(filename, "_")[[1]]
  hes <- filename_split[2]
  return(hes)
}

get_efu <- function(filename) {
  filename_split <- strsplit(filename, "_")[[1]]
  efu <- filename_split[3]
  return(efu)
}

get_year <- function(filename) {
  filename_split <- strsplit(filename, "_")[[1]]
  year <- substr(filename_split[4], 3, 4)
  return(year)
}



