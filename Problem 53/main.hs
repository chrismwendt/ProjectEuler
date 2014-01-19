import Data.Ratio

main = print $ length $ filter (> 10^6) $ [nCr n r | n <- [1..100], r <- [1..n]]

nCr :: Integer -> Integer -> Integer
nCr n r = numerator $ product $ map (\i -> (n - (r - i)) % i) [1..r]
