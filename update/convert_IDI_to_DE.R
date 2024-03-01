#Takes IDI output and saves in .csv format to be used with DE

#Load libraries
library(data.table)
library(openxlsx)

#change to appropriate filename
filename <- "update/DistExpl_HES20_TY20_HYEFU21.xlsx"


##to be updated to read from standard DE IDI output

#format: YY
hes <- "20"

#e.g. "HYEFU21"
efu <- "HYEFU21"

#format: YY
year <- "20"

#open file, load descriptors and values and merge into single datatable
wb <- openxlsx::loadWorkbook(filename)
descriptors <- data.table(openxlsx::read.xlsx(wb, sheet = "Descriptors"))
values <- data.table(openxlsx::read.xlsx(wb, sheet = "Values"))
output <- merge(descriptors, values, by = "Index")

#write new data version to data folder
fwrite(output, paste0("app/data/DE_HES", hes, "_", efu, "_TY", year, ".csv"))

