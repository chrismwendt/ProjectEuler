import Data.Numbers.Primes
import Data.List

main :: IO ()
main = print $ head $ solutions 1000000

solutions :: Integer -> [Integer]
solutions lim = filter isPrime $ concatMap (sums maxPrime) $ reverse [1 .. maxSumLen maxPrime]
    where
    maxPrime = head $ filter isPrime [lim, lim - 1 .. 2]
    maxSumLen p = length $ takeWhile (<= p) cumPrimes

sums :: Integer -> Int -> [Integer]
sums lim len = takeWhile (<= lim) $ zipWith (-) (drop len cumPrimes) cumPrimes

cumPrimes :: [Integer]
cumPrimes = scanl1 (+) primes
