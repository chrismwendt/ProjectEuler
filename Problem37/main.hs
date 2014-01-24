import Data.Numbers.Primes
import Data.List

main = print $ sum $ take 11 $ filter truncatable $ filter (> 9) primes

truncatable n = all isPrime $ map read $ filter (not . null) $ tails (show n) ++ inits (show n)
