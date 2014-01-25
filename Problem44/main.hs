main :: IO ()
main = print $ head solutions

-- Try all pairs (d, o) where o <= d because if o > d then j < 0.
-- Pk, Pj, and Ps can be determined for a given (d, o).
-- Pk = P(j+o)
-- Pd = Pk - Pj = P(j+o) - Pj = ... = 3jo + Po
-- j = (Pd - Po) / 3o
-- Ps = 2Pj + Pd
solutions :: [Integer]
solutions =
    [pd |
        (d, pd) <- zip [1..] pentagons,
        (o, po) <- zip [1..d - 1] pentagons,
        let (j, r) =  (pd - po) `divMod` (3 * o),
        r == 0,
        isPentagonal (2 * pentagon j + pd)]

-- Pn = n(3n-1)/2
-- 3n^2 - n - 2Pn = 0
-- n = (1 + sqrt (1 + 24Pn)) / 6
isPentagonal :: Integer -> Bool
isPentagonal pn = isSquare d && (1 + sqrti d) `mod` 6 == 0
    where
    d = 1 + 24 * pn

isSquare :: Integer -> Bool
isSquare x = (sqrti x)^2 == x

sqrti :: Integer -> Integer
sqrti = floor . sqrt . fromIntegral 

pentagon :: Integral a => a -> a
pentagon n = n * (3 * n - 1) `div` 2

pentagons :: [Integer]
pentagons = map pentagon [1..]
