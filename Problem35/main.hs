import Data.Numbers.Primes

main = print $ length $ filter isCircular $ takeWhile (< 1000000) primes

isCircular n = all isPrime $ map (\i -> read $ take l $ drop i $ cycle s) [1..l]
    where
    l = length s
    s = show n
