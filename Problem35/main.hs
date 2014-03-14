import Data.Numbers.Primes

main :: IO ()
main = print $ length $ filter isCircular $ takeWhile (< 1000000) primes

isCircular :: Show a => a -> Bool
isCircular n = all isPrime $ map (\i -> read $ take l $ drop i $ cycle s) [1 .. l]
    where
    l = length s
    s = show n
