import Data.List

main :: IO ()
main = print $ maximum $ primeFactors 600851475143

primeFactors :: Integer -> [Integer]
primeFactors n = case find ((== 0) . mod n) [2 .. n] of
    Just k -> k : primeFactors (n `div` k)
    Nothing -> []
