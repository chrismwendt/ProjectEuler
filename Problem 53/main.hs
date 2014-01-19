import Data.Ratio

main = print $ length $ filter (> 10^6) $ concatMap (\n -> map (\r -> nCr n r) [1..n]) [1..100]

nCr :: Integer -> Integer -> Integer
nCr n r = numerator $ product $ map (\i -> (n - (r - i)) % i) [1..r]
