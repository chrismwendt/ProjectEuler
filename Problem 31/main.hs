import Data.List

main = print $ ways [1, 2, 5, 10, 20, 50, 100, 200] 200

ways ds v = ways' ds v v
ways' _ 0 _ = 1
ways' ds v m = sum $ [ways' ds (v - d) (min d m) | d <- ds, d <= m, d <= v]
