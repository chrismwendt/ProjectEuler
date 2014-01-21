import Data.Numbers.Primes
import Data.Maybe
import Data.List

main :: IO ()
main = print $ head
    [[a, b, c, d, e] |
        a <- primes,
        b <- filter (\p -> concatable p [a]) $ takeWhile (< a) primes,
        c <- filter (\p -> concatable p [a, b]) $ takeWhile (< b) primes,
        d <- filter (\p -> concatable p [a, b, c]) $ takeWhile (< c) primes,
        e <- filter (\p -> concatable p [a, b, c, d]) $ takeWhile (< d) primes]

concatable :: Integer -> [Integer] -> Bool
concatable i ps = and [isPrime (read $ i' ++ p') && isPrime (read $ p' ++ i') |
    p <- ps,
    let (i', p') = (show i, show p)]
