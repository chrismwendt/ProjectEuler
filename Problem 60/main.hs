import Data.Numbers.Primes
import Data.Maybe
import Data.List

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
concatable ps i = and [isPrime $ read $ f (++) (show i) (show p) | p <- ps, f <- [id, flip]]
