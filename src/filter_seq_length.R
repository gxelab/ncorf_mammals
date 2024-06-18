library(Biostrings)
library(BiocGenerics)
library(tidyverse)

args <- commandArgs(trailingOnly = TRUE)
input <- args[1]
output <- args[2]
fasta <- readDNAStringSet(input)
human_seq <- nchar(str_remove_all(as.character(fasta['hg38']), '-'))
filter_fa <- fasta[width(str_remove_all(as.character(fasta), '-')) > human_seq*0.5]
writeXStringSet(filter_fa, output)
