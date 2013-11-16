main = do
    putStrLn . show $ head $ filter palindrome $ descendingProducts

descendingProducts = descendingProducts' 999 999

descendingProducts' n m = n * m : mergeBy descending column rest
    where descending = flip compare
          column = [n * i | i <- [m,(m - 1)..100]]
          rest = descendingProducts' (n - 1) (m - 1)

palindrome n = s == reverse s
    where s = show n

mergeBy cmp a [] = a
mergeBy cmp [] b = b
mergeBy cmp (a:as) (b:bs)
    | cmp a b == LT = a : mergeBy cmp as (b:bs)
    | otherwise = b : mergeBy cmp (a:as) bs
