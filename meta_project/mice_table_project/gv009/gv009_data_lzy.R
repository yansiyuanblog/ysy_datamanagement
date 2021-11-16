# contact binbin.zhao
# /usr/local/bin/Rscript gv009_data.R
<<<<<<< HEAD
file_origin <- read.csv("/home/caowq/Project/microbial_network_infer/Lvgu/GV009/data/data_management/meta_table/mice_meta_table_20201016_20201202.csv", fileEncoding = "GBK", header = TRUE)
output_dir <- "/home/caowq/Project/microbial_network_infer/Lvgu/GV009/data/data_management/meta_project/mice_table_project/gv009"
=======
file_origin <- read.csv("/Users/admin/Desktop/git_projects/data_management/meta_table/mice_meta_table_20201016_20201120.csv", fileEncoding = "GBK", header = TRUE)
output_dir <- "/Users/admin/Desktop/git_projects/data_management/meta_project/mice_table_project/GV009"
>>>>>>> ee0cdd03be0b7f3f8f687272835542e3c6531003
drug <- file_origin$Drug
file_filter_gv009 <- subset(file_origin, grepl("GV009", drug))
file_filter_gv009$Drug
file_filter_project <- file_filter_gv009$Project
file_filter_project <- file_filter_project[!duplicated(file_filter_project)]
file_filter <- subset(file_origin, file_origin$Project %in% file_filter_project)
project_id <- c("GV007", "GV971", "JG6")
file_filter1 <- subset(file_filter, !file_filter$Drug %in% project_id)
write.table(file_filter1,file = paste(output_dir, "/gv009_all_", Sys.Date(), ".csv",sep = ""),sep = ",", row.names = FALSE)
