import Data.List

main :: IO ()
-- main = undefined
main = print $ sum $ head $ concatMap (derp 2) $ cyclicPermutations $ map (range 1000 9999) $ take 6 polygons

-- TODO try coming up with a formula for polygonal ceiling
-- TODO try deriving the recurrences

derp :: Int -> [[Int]] -> [[Int]]
derp _ [] = []
derp overlap (ps:pss) = filter (\l -> (lastN overlap $ show (last l)) == (take overlap $ show (head l))) $ filter (\l -> length l == length pss + 1) $ concatMap f ps
    where
    f p = map (\l -> p : l) $ derp' (lastN overlap $ show p) pss

derp' :: String -> [[Int]] -> [[Int]]
derp' _ [] = []
derp' prefix [a] = [filter (isPrefixOf prefix . show) a]
derp' prefix (ps:pss) = concatMap f ps'
    where
    ps' = filter (isPrefixOf prefix . show) ps
    f p = map (\l -> p : l) $ derp' (lastN (length prefix) $ show p) pss

lastN :: Int -> [a] -> [a]
lastN n = reverse . take n . reverse

cyclicPermutations :: [a] -> [[a]]
cyclicPermutations (a:as) = map (a :) $ permutations as

polygons :: [[Int]]
polygons = map (flip map [1..]) polyganizes

polyganizes :: [Int -> Int]
polyganizes =
    [ \n -> n * (n + 1) `div` 2
    , \n -> n * n
    , \n -> n * (3 * n - 1) `div` 2
    , \n -> n * (2 * n - 1)
    , \n -> n * (5 * n - 3) `div` 2
    , \n -> n * (3 * n - 2)
    ]


range :: Ord a => a -> a -> [a] -> [a]
range a b = takeWhile (<= b) . dropWhile (< a)
