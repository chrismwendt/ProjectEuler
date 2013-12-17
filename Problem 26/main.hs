main = print $ fst $ maximumBy snd $ zip [1..] $ map (cycleLength 1) [1..999]

cycleLength n d = cycleLength' n d []
cycleLength' n d m
    | r == 0 = 0
    | q == 0 = cycleLength' (10 * n) d ((q, r): m)
    | any ((== r) . snd) m = length (takeWhile ((/= r) . snd) m) + 1
    | otherwise = cycleLength' r d ((q, r) : m) where
    (q, r) = quotRem n d

maximumBy f = foldr1 (\a b -> if compare (f a) (f b) == GT then a else b)
