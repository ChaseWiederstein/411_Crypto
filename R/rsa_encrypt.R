M <- 7
p <- 3
q <- 5
e <- 11

rsa_encrypt <- function(M = 7, p = 3, q = 5, e = 11){
  n <- p * q
  (M^e) %% n
}

# M = c(1:100)
# rsa_encrypt(M = M)
