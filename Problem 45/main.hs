main = print $ head $ filter (> 40755) solutions

solutions =
    [t |
        t <- map triangle [1..],
        and $ map ($ t) [isPentagonal, isHexagonal]]

triangle n = n * (n + 1) `div` 2

isTriangular tn = isSquare d && sqrti d `mod` 2 == 1
    where
    d = 1 + 8 * tn

pentagon n = n * (3 * n - 1) `div` 2

isPentagonal pn = isSquare d && sqrti d `mod` 6 == 5
    where
    d = 1 + 24 * pn

hexagon n = n * (2 * n - 1)

isHexagonal hn = isSquare d && sqrti d `mod` 4 == 3
    where
    d = 1 + 8 * hn

isSquare x = (sqrti x)^2 == x

sqrti = floor . sqrt . fromIntegral 
