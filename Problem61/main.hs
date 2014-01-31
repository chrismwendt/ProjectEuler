import Data.List
import Data.Maybe

main :: IO ()
main = print $ sum $
    fromJust $ find (\l -> overlap2 (last l) (head l)) $ concatMap (sequenceF f) $
    cyclicPermutations $ map (takeWhile (< 10000) . dropWhile (< 1000)) polygons
    where
    f x = filter (\l -> null l || overlap2 x (head l))

sequenceF :: Monad m => (a -> m [a] -> m [a]) -> [m a] -> m [a]
sequenceF f = foldr mfcons (return [])
    where
    mfcons p q = p >>= \x -> f x q >>= \y -> return (x:y)

overlap2 :: Int -> Int -> Bool
overlap2 a b = a `mod` 100 == b `div` 100

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
