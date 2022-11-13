# url: https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-175Br1.pdf
df <- read.csv("./data-raw/acronym/nist_acronyms.csv", na.strings = "", header = F)
df1 <- 
  df |> 
  na.omit(df) |> 
  dplyr::rename(acronym = V1,
                defined = V2)
row.names(df1) <- NULL
df1[2, 2] <- "American National Standard"
df1[14, 2] <- "Diffie-Hellman algorithm"
df1[36, 2] <- "Menezes-Qu-Vanstone algorith; specified in SP 800-56A15"
saveRDS(df1, file = "./data/acronyms.rds") #ascii = T
