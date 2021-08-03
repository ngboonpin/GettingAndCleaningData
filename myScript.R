library(readr)
library(dplyr)
library(ggplot2)
library(forcats)
library(logr)
library(jsonlite)

#set working directory
#setwd("C:/ProgramData/Docker/RImagePrep")

#get environment variables
path_logs <- Sys.getenv("LOGS","/data/logs/")
tmp <- file.path(path_logs,"custom.log")
log_open(tmp)
log_print("Get environment variables")
log_print(paste0("LOGS:", path_logs))

path_input <- Sys.getenv("INPUTS","/data/inputs/")
log_print(paste0("INPUTS:", path_input))

path_output <- Sys.getenv("INPUTS","/data/outputs/")
log_print(paste0("OUTPUTS:", path_output))


dids <- fromJSON(Sys.getenv("DIDS","[]"))
log_print(paste0("DIDS:", dids))

did <- dids[1]
input_files_path <- paste0(path_input,dids)
log_print(paste0("input_files_path:", input_files_path))

# import dataframe
##list.files(path = input_files_path, pattern = ".csv", recursive = TRUE)
df <- lapply(list.files(path = input_files_path, recursive = TRUE), read.csv)
log_print("Read input files")

df <- Reduce(rbind, df)
log_print("Combine dataframe")

# manipulate data
log_print("Start Aggregating Data")
plot_data <- df %>%
  group_by(state) %>%
  count()
log_print("Aggregate Data")

# save manipulated data to output folder
log_print("Start writing to file")
write_csv(plot_data, paste0(path_output,"/plot_data.csv"))
log_print("Complete writing to file")

# create plot based on manipulated data
log_print("Start plotting chart")
plot <- plot_data %>% 
  ggplot()+
  geom_col(aes(fct_reorder(state, n), 
               n, 
               fill = n))+
  coord_flip()+
  labs(
    title = "Number of people by state",
    subtitle = "From US-500 dataset",
    x = "State",
    y = "Number of people"
  )+ 
  theme_bw()

# save plot to output folder
ggsave(paste0(path_output,"/myplot.png"), width = 10, height = 8, dpi = 100)
log_print("Saved chart")
