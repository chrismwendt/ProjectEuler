import Data.List

main :: IO ()
main = print $ sum $ nub $ map _1of3 $ filter isPandigital $ takeWhile ((<= 10000) . _1of3) [(n*m, n, m) | n <- [1 .. 10000], m <- [1 .. 10000 `div` n]]

isPandigital :: Show a => (a, a, a) -> Bool
isPandigital (n, m, p) = sort (concatMap show [n, m, p]) == ['1' .. '9']

_1of3 :: (t1, t2, t3) -> t1
_1of3 (v, _, _) = v
