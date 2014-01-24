import Data.Numbers.Primes
import Data.List

main = print $ head $ solutions 1000000

solutions lim = filter isPrime $ concatMap (sums maxPrime) $ reverse [1 .. maxSumLen maxPrime]
    where
    maxPrime = head $ filter isPrime [lim, lim - 1 .. 2]
    maxSumLen p = length $ takeWhile (<= p) cumPrimes

sums lim len = takeWhile (<= lim) $ zipWith (-) (drop len cumPrimes) cumPrimes

cumPrimes = scanl1 (+) primes
