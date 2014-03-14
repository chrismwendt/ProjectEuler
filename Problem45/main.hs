main :: IO ()
main = print $ head $ filter (> 40755) solutions

solutions :: [Integer]
solutions =
    [t |
        t <- map triangle [1 .. ],
        and $ map ($ t) [isPentagonal, isHexagonal]]

triangle :: Integral a => a -> a
triangle n = n * (n + 1) `div` 2

isTriangular :: Integer -> Bool
isTriangular tn = isSquare d && sqrti d `mod` 2 == 1
    where
    d = 1 + 8 * tn

pentagon :: Integral a => a -> a
pentagon n = n * (3 * n - 1) `div` 2

isPentagonal :: Integer -> Bool
isPentagonal pn = isSquare d && sqrti d `mod` 6 == 5
    where
    d = 1 + 24 * pn

hexagon :: Num a => a -> a
hexagon n = n * (2 * n - 1)

isHexagonal :: Integer -> Bool
isHexagonal hn = isSquare d && sqrti d `mod` 4 == 3
    where
    d = 1 + 8 * hn

isSquare :: Integer -> Bool
isSquare x = (sqrti x)^2 == x

sqrti :: Integer -> Integer
sqrti = floor . sqrt . fromIntegral 
