# contact binbin.zhao
# /usr/local/bin/Rscript gv009_data.R
# 用之前要先将csv转化为excel
library(xlsx)
# file_origin <- read.xlsx("/Users/admin/Desktop/data_management/meta_table/mice_meta_table_20201016_20201109.xlsx", sheetIndex = 1)
file_origin <- read.csv("/Users/admin/Desktop/data_management/meta_table/mice_meta_table_20201016_20201109.csv", fileEncoding = "GBK", header = TRUE)
output_dir <- "/Users/admin/Desktop/data_management/meta_project/mice_table_project/GV009"
drug <- file_origin$Drug
file_filter_gv009 <- subset(file_origin, grepl("GV009", drug))
file_filter_gv009$Drug
file_filter_project <- file_filter_gv009$Project
file_filter_project <- file_filter_project[!duplicated(file_filter_project)]
file_filter <- subset(file_origin, file_origin$Project %in% file_filter_project)
project_id <- c("GV007", "GV971", "JG6")
file_filter1 <- subset(file_filter, !file_filter$Drug %in% project_id)
write.table(file_filter,file = paste(output_dir, "/gv009_all_", Sys.Date(), ".csv",sep = ""),sep = ",", row.names = FALSE)
