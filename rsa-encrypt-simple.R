# wikipedia: https://en.wikipedia.org/wiki/RSA_(cryptosystem)
# How RSA Works with Examples: https://doctrina.org/How-RSA-Works-With-Examples.html
# 5.3. RSA Public Key Cryptography: https://www.garykessler.net/library/crypto.html#dhmath
# vignette("bignum", package = "openssl")
# vignette("intro", package = "sodium")
primes <- readRDS("./data/primes.rds")
primes <- matrix(primes, ncol = 1, byrow = T)

#First, the receiver generates 2 public keys n and e, and one private key d by:
## Public key n
## 
## Choose two prime numbers, p and q. From these numbers you can calculate the modulus, n = pq.

p <- 3
q <- 5
n <- p * q
y <- (p-1)*(q-1)

# Select a third number, e, that is relatively prime to (i.e., it does not divide evenly into) the product (p-1)(q-1). The number e is the public exponent.
# Choosing another prime number e, such that 3<e<n-1
# (p -1) * (q - 1) = 8, so choose 11
e <- 11

# Calculate an integer d from the quotient (ed-1)/[(p-1)(q-1)]. The number d is the private exponent.
d <-  3

# Message or "M" = "7"
M <- 7

#  Ciphertext: 
C <- (M^e) %% n

# receiver decrypts the ciphertext using the private key value (d,n)=(3,15)
(C^d) %% n

rm(list = ls())

##### Part 0 #######
#install.packages("openssl")
library("openssl")

##### Part 1 #######
# Create Public & Private Keys

p=bignum("112481050639317229656723018120659623829736571015511322021617837187076258724819")
q=bignum("89185111938335771293328323333111422985697062149139368049232365065924632677343")

n = p*q
y = (p-1)*(q-1)
e=bignum("65537")

d=bignum_mod_inv(e,y)
print(d)

##### Part 2 #######
# Encrypt a message

m= bignum(charToRaw("Running late. Wait for me."))
#print(m)
c=bignum_mod_exp(m,e,n)
#print(c)
x = base64_encode(c)
print(x)

##### Part 3 #######
# Decrypt a message

x = 'rGhkBLUmPQStyYGrhIcNxnhZw6GeGoFGswZuUihd+kPx21VtPSMmdBRQOkKw8uLPhsh0NV4qk27G/EFuVT2iAw=='

c = bignum(base64_decode(x))
m=bignum_mod_exp(c,d,n)
m = rawToChar(m)
print(m)
