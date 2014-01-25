import Data.Numbers.Primes
import Data.List

main :: IO ()
main = print $ sum $ take 11 $ filter truncatable $ filter (> 9) primes

truncatable :: Show a => a -> Bool
truncatable n = all isPrime $ map read $ filter (not . null) $ tails (show n) ++ inits (show n)
