import Data.Numbers.Primes
import Data.List

main = print $ head $ head $ solutions

solutions =
    [is |
        is <- map (take 4) $ tails [1..],
        all ((== 4) . length . nub . primeFactors) is]
