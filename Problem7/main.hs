import Data.Numbers.Primes

main :: IO ()
main = print $ primes !! (10001 - 1) -- zero-based indices
