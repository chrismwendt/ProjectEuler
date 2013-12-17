import Data.Char
import Data.List
import Data.Function

main = print $ sum $ nub $ map trd $ filter isPandigital $ takeWhile ((<= 10000) . trd) $ ascendingProducts [1..] [1..]

isPandigital (n, m, p) = sort (concatMap show [n, m, p]) == ['1'..'9']

ascendingProducts [] _ = []
ascendingProducts _ [] = []
ascendingProducts (n:ns) (m:ms) = (n, m, n * m) : mergeBy (compare `on` trd) column rest
    where
    column = map (\m -> (n, m, n * m)) ms
    rest = ascendingProducts ns ms

trd (a, b, c) = c

mergeBy cmp a [] = a
mergeBy cmp [] b = b
mergeBy cmp (a:as) (b:bs)
    | cmp a b == LT = a : mergeBy cmp as (b:bs)
    | otherwise = b : mergeBy cmp (a:as) bs
