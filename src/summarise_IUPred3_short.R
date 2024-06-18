libary(tidyverse)
args <- commandArgs(trailingOnly = TRUE)

file <- args[1]
output_sum_data <- args[2]
output_final_file <- args[3]

short_files <- list.files(file, pattern = '_short.tsv' , full.names = T)
names(short_files) <- sub(file, '', basename(short_files))
iupred <- function(x) {
  dtt <- read_tsv(x, skip = 12, col_names = F) 
}
sum_data <- bind_rows(lapply(short_files, iupred), .id = 'id')
write_tsv(sum_data,output_sum_data)

data <- read_tsv("human_ncorf_sum_IUPred.tsv") %>%
  group_by(id) %>%
  mutate(seq =str_c(X2, collapse = ""),
         iupred32 = str_c(X3, collapse = ",")) %>%
  distinct(id, .keep_all = T) %>%
  select(1,5,6) %>%
  mutate(id = sub(".fa_.*", "", id))

write(data, output_final_file)
