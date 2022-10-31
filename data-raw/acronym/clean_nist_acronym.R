df <- read.csv("./data-raw/acronym/nist_acronyms.csv", na.strings = "", header = F)
install.packages("dplyr")
library(dplyr)
df1 <- 
  df |> 
  na.omit(df) |> 
  dplyr::rename(acronym = V1,
                defined = V2)
saveRDS(df1, file = "./data/acronyms.rds")
