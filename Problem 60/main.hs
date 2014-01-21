import Data.Numbers.Primes
import Data.Maybe
import Data.List

main :: IO ()
main = print $ sum $ head $ concatableSetsN 5

concatableSetsN :: Integer -> [[Integer]]
concatableSetsN n = concatMap (\p -> concatableSetsN' [p] n) primes

concatableSetsN' :: [Integer] -> Integer -> [[Integer]]
concatableSetsN' prevs n
    | genericLength prevs == n = [prevs]
    | otherwise = concat [concatableSetsN' (p:prevs) n |
        p <- filter (concatable prevs) $ takeWhile (< head prevs) primes]

concatable :: [Integer] -> Integer -> Bool
concatable ps i = and [isPrime (read $ i' ++ p') && isPrime (read $ p' ++ i') |
    p <- ps,
    let (i', p') = (show i, show p)]
