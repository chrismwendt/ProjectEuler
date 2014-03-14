import Data.List
import Data.Maybe

main :: IO ()
main = print $ fromJust $ find (palindrome . show) $ descendingProducts ns ns where
    ns = [999, 998 .. 100]

descendingProducts :: (Num a, Ord a) => [a] -> [a] -> [a]
descendingProducts [] _ = []
descendingProducts _ [] = []
descendingProducts (n:ns) (m:ms) = n * m : mergeBy descending column rest where
    descending = flip compare
    column = map (* n) ms
    rest = descendingProducts ns ms

palindrome :: Eq a => [a] -> Bool
palindrome s = s == reverse s

mergeBy :: (t -> t -> Ordering) -> [t] -> [t] -> [t]
mergeBy _ a [] = a
mergeBy _ [] b = b
mergeBy cmp (a:as) (b:bs)
    | cmp a b == LT = a : mergeBy cmp as (b:bs)
    | otherwise = b : mergeBy cmp (a:as) bs
