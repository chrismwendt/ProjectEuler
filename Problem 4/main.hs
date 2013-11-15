main = do
    putStrLn . show $ head $ filter palindrome $ things

things = things' 999 999

things' n 100 = [n * 100]
things' 100 m = [100 * m]
things' n m
    | n == m = n * m : mergeBy (\a b -> signum (b - a)) (things' (n - 1) (m - 1)) (things' n (m - 1))
    | otherwise = n * m : things' n (m - 1)

palindrome n = s == reverse s
    where s = show n

mergeBy cmp a [] = a
mergeBy cmp [] b = b
mergeBy cmp aas@(a:as) abs@(b:bs)
    | cmp a b <= 0 = a : mergeBy cmp as abs
    | otherwise = b : mergeBy cmp aas bs
