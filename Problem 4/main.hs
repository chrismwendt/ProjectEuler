main = do
    putStrLn . show $ head $ filter palindrome $ descendingProducts ns ns
    where ns = [999,998..100]

descendingProducts [] _ = []
descendingProducts _ [] = []
descendingProducts (n:ns) (m:ms) = n * m : mergeBy descending column rest
    where descending = flip compare
          column = map (* n) ms
          rest = descendingProducts ns ms

palindrome n = s == reverse s
    where s = show n

mergeBy cmp a [] = a
mergeBy cmp [] b = b
mergeBy cmp (a:as) (b:bs)
    | cmp a b == LT = a : mergeBy cmp as (b:bs)
    | otherwise = b : mergeBy cmp (a:as) bs
