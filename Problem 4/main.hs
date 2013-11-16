main = do
    putStrLn . show $ head $ filter palindrome $ things

things = things' 999 999

things' n m = n * m : mergeBy descending column rest
    where descending = flip compare
          column = (map (*n) [m,(m - 1)..100])
          rest = (things' (n - 1) (m - 1))

palindrome n = s == reverse s
    where s = show n

mergeBy cmp a [] = a
mergeBy cmp [] b = b
mergeBy cmp (a:as) (b:bs)
    | cmp a b == LT = a : mergeBy cmp as (b:bs)
    | otherwise = b : mergeBy cmp (a:as) bs
