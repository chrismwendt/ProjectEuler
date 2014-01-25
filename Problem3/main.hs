isFactor :: Integral a => a -> a -> Bool
isFactor a b = mod b a == 0

factors :: Integral t => t -> [t]
factors n = [i | i <- [1..n], isFactor i n]

primeFactors :: Integral a => a -> [a]
primeFactors 1 = []
primeFactors n = p : primeFactors (n `div` p) where
    p = factors n !! 1

main :: IO ()
main = print $ maximum $ primeFactors 600851475143
