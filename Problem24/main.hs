import Data.List

main = putStrLn $ nthPermutation (1000000 - 1) ['0'..'9']

nthPermutation 0 a = a
nthPermutation n a = a !! i : nthPermutation j (remove i a) where
    (i, j) = divMod n (factorial $ length a - 1)

remove i as = l ++ tail r where
    (l, r) = splitAt i as

factorial n = product [1..n]
