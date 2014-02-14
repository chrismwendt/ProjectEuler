import Data.Numbers.Primes
import Data.Maybe
import Data.List
import Math.NumberTheory.Logarithms

-- TODO try using a concatable lookup table with the state monad

main :: IO ()
main = print $ sum $ head $ setsN 5

setsN :: Integer -> [[Integer]]
setsN n = concatMap (\p -> setsN' [p] n) primes

setsN' :: [Integer] -> Integer -> [[Integer]]
setsN' prevs n
    | genericLength prevs == n = [prevs]
    | otherwise = concat [setsN' (p:prevs) n |
        p <- filter (concatable prevs) $ takeWhile (< head prevs) primes]

concatable :: [Integer] -> Integer -> Bool
concatable ps i = and [isPrime $ f concatenate i p | p <- ps, f <- [id, flip]]

concatenate :: Integer -> Integer -> Integer
concatenate a b = a * 10^(integerLogBase 10 b + 1) + b
