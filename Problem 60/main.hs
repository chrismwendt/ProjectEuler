import Data.Numbers.Primes
import Data.Maybe
import Data.List

main :: IO ()
main = print $ sum $ head $ concatableSetsN 5

concatableSetsN :: Integer -> [[Integer]]
concatableSetsN n = concatMap (\p -> map ((:) p) $ concatableSetsN' [p] (n - 1)) primes

concatableSetsN' :: [Integer] -> Integer -> [[Integer]]
concatableSetsN' prevs n
    | n == 0 = [[]]
    | otherwise = [p : set |
        p <- filter (concatable prevs) $ takeWhile (< head prevs) primes,
        set <- concatableSetsN' (p:prevs) (n - 1)]

concatable :: [Integer] -> Integer -> Bool
concatable ps i = and [isPrime (read $ i' ++ p') && isPrime (read $ p' ++ i') |
    p <- ps,
    let (i', p') = (show i, show p)]
