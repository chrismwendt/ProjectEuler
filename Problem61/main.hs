import Data.List
import Data.Maybe

main :: IO ()
main = print $ sum $ fromJust $ find (\l -> overlap2 (last l) (head l)) $ concatMap gen $ cyclicPermutations $ zip polyCeil nextPoly

gen :: [(Int -> Int, Int -> Int)] -> [[Int]]
gen = foldr mfcons [[]]
    where
    mfcons (ce, ne) qss = [p:qs | p <- prange 1000 9999 ce ne, qs <- qss, overlaps (p:take 1 qs)]

prange :: Int -> Int -> (Int -> Int) -> (Int -> Int) -> [Int]
prange l h fceil fnext = takeWhile (<= h) $ iterate fnext (fceil l)

overlaps :: [Int] -> Bool
overlaps as = and $ zipWith overlap2 as (tail as)

overlap2 :: Int -> Int -> Bool
overlap2 a b = lastN 2 (show a) == take 2 (show b)

lastN :: Int -> [a] -> [a]
lastN n = reverse . take n . reverse

cyclicPermutations :: [a] -> [[a]]
cyclicPermutations (a:as) = map (a :) $ permutations as

nToPolygon :: [Int -> Int]
nToPolygon =
    [ \n -> n * (n + 1) `div` 2
    , \n -> n * n
    , \n -> n * (3 * n - 1) `div` 2
    , \n -> n * (2 * n - 1)
    , \n -> n * (5 * n - 3) `div` 2
    , \n -> n * (3 * n - 2)
    ]

polygonToNCeiling :: [Int -> Int]
polygonToNCeiling = map (\f -> ceiling . f . fromIntegral)
    [ \p -> (-1)/2 + sqrt (1/4 + 2*p)
    , \p -> sqrt p
    , \p -> (1/2 + sqrt (1/4 + 6*p)) / 3
    , \p -> (1 + sqrt (1 + 8*p)) / 4
    , \p -> (3/2 + sqrt (9/4 + 10*p)) / 5
    , \p -> (2 + sqrt (4 + 12*p)) / 6
    ]
    
polyCeil :: [Int -> Int]
polyCeil = zipWith (.) nToPolygon polygonToNCeiling

nextPoly :: [Int -> Int]
nextPoly = map (. (+1)) polyCeil
