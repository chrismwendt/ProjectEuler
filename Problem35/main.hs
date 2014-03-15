import Data.Numbers.Primes

main :: IO ()
main = print $ length $ filter isCyclicPrime $ takeWhile (< 1000000) primes

isCyclicPrime :: Show a => a -> Bool
isCyclicPrime n = all isPrime $ map (\i -> read $ take l $ drop i $ cycle s) [1 .. l]
    where
    l = length s
    s = show n
