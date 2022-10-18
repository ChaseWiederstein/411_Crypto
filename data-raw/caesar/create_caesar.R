#regular alphabet
m_alpha <- matrix(LETTERS, nrow = 1)
df_a <- data.frame(letters = m_alpha)
colnames(df_a) <- 0:25
df_a
#shift alphabet by 5
m_shift <- matrix(c(LETTERS[22:26], LETTERS[1:21]), nrow = 1)
df_s <- data.frame(letters = m_shift)
colnames(df_s) <- 0:25

#combine
df <- rbind(df_a, df_s)
row.names(df) <- c("Alphabet", "Caesar")

#save
saveRDS(df, "./data/caesar.rds")
