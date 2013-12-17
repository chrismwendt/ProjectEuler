main = print $ fst $ maximumBy snd $ zip [1..] $ map (cycleLength 1) [1..999]

cycleLength n d = cycleLength' n d []
cycleLength' n d rs
    | r == 0 = 0
    | q == 0 = cycleLength' (10 * n) d (r: rs)
    | any (== r) rs = length (takeWhile (/= r) rs) + 1
    | otherwise = cycleLength' r d (r : rs) where
    (q, r) = quotRem n d

maximumBy f = foldr1 (\a b -> if compare (f a) (f b) == GT then a else b)
