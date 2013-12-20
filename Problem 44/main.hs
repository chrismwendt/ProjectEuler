import Data.Function
import Data.List
import Data.Maybe

main = print $ fromJust $ find t12 pathy

t1 = (\(pj, pk, d) -> isPentagonal (pj + pk))
t2 = (\(pj, pk, d) -> isPentagonal d)
t12 = (\(pj, pk, d) -> isPentagonal d && isPentagonal (pj + pk))

pathy = mergeNBy (compare `on` (\(pj, pk, d) -> d)) [[(pj, pk, d) | k <- [j + 1..], let (pj, pk) = (pentagon j, pentagon k), let d = abs (pk - pj)] | j <- [1..]]

pentagon n = n * (3 * n - 1) `div` 2

pentagons = map pentagon [1..]

-- Pn = n(3n-1)/2
-- 3n^2 - n - 2Pn = 0
-- n = (1 + sqrt (1 + 24Pn)) / 6
isPentagonal pn = isSquare d && (1 + sqrt' d) `mod` 6 == 0
    where
    d = 1 + 24 * pn

isSquare x = (sqrt' x)^2 == x

sqrt' = floor . sqrt . fromIntegral 

merge2By cmp a [] = a
merge2By cmp [] b = b
merge2By cmp (a:as) (b:bs)
    | cmp a b == GT = b : merge2By cmp (a:as) bs
    | otherwise = a : merge2By cmp as (b:bs)

mergeNBy cmp [] = []
mergeNBy cmp (l:ls) = head l : merge2By cmp (tail l) (mergeNBy cmp ls)
