import Data.Numbers.Primes
import Data.List

main :: IO ()
main = print $ length $ filter isCyclicPrime $ takeWhile (< 1000000) primes

isCyclicPrime n = all (isPrime . read) $ init $ zipWith (++) (tails s) (inits s)
    where
    s = show n
