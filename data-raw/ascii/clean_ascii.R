file = "./data-raw/ascii/ascii.csv"
df <- readr::read_csv(file = file, show_col_types = FALSE)
saveRDS(df, file = "./data/ascii.rds")