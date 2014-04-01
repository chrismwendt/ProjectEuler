import Data.Numbers.Primes
import Data.List
import Data.Ord
import Data.Ratio

main :: IO ()
main = print $ maximumBy (comparing (\n -> n % phi n)) [2 .. 1000000]

phi :: Integer -> Integer
phi n = n * numerator (product $ map (\p -> 1 - 1 % p) $ nub $ primeFactors n)
