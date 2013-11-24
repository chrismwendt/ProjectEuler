isFactor a b = mod b a == 0

factors n = [i | i <- [1..n], isFactor i n]

primeFactors 1 = []
primeFactors n = p : primeFactors (n `div` p)
    where p = (factors n) !! 1

main = print $ maximum $ primeFactors 600851475143
