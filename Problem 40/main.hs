import Data.Char

main = print $ product $ map d (map (10^) [0..6])

d i = d' (1, i - 1)
d' (l, i)
    | i <= l * c = let (d, m) = i `divMod` l in digitToInt $ show (10^(l - 1) + d) !! m
    | otherwise = d' (l + 1, i - l * c)
    where
    c = (10^l - 10^(l - 1))
