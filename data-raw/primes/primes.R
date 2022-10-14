file <- "https://primes.utm.edu/lists/small/1000.txt"
df <- readr::read_table(file = file, skip = 3, col_names = F, n_max = 100)
df <- df[, -11]
df1 <- df |> tidyr::pivot_longer(cols = X1:X10)
primes <- df1$value
m <- matrix(primes[1:400], ncol = 10, byrow = TRUE)
saveRDS(m, file = "./data/primes.rds")
