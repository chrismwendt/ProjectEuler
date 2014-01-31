import Data.List
import Data.Maybe

main :: IO ()
main = print $ sum $ fromJust $ find (\l -> overlap2 (last l) (head l)) $ concatMap (sequenceF f) $ cyclicPermutations $ map (range 1000 9999) $ take 6 polygons
    where
    f x = filter (\l -> overlaps (x:take 1 l))

sequenceF :: Monad m => (a -> m [a] -> m [a]) -> [m a] -> m [a]
sequenceF f = foldr mfcons (return [])
    where
    mfcons p q = p >>= \x -> f x q >>= \y -> return (x:y)

overlaps :: [Int] -> Bool
overlaps as = and $ zipWith overlap2 as (tail as)

overlap2 :: Int -> Int -> Bool
overlap2 a b = lastN 2 (show a) == take 2 (show b)

lastN :: Int -> [a] -> [a]
lastN n = reverse . take n . reverse

cyclicPermutations :: [a] -> [[a]]
cyclicPermutations (a:as) = map (a :) $ permutations as

polygons :: [[Int]]
polygons = map (flip map [1..]) nToPolygon

nToPolygon :: [Int -> Int]
nToPolygon =
    [ \n -> n * (n + 1) `div` 2
    , \n -> n * n
    , \n -> n * (3 * n - 1) `div` 2
    , \n -> n * (2 * n - 1)
    , \n -> n * (5 * n - 3) `div` 2
    , \n -> n * (3 * n - 2)
    ]


range :: Ord a => a -> a -> [a] -> [a]
range a b = takeWhile (<= b) . dropWhile (< a)
