import Data.List
import Data.Numbers.Primes

main :: IO ()
main = print $ maximum $ primeFactors 600851475143
