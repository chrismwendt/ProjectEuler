main = print $ fst $ maximumBy (length . snd) $ zip [1..] $ map (recurringCycle 1) [1..(1000 - 1)]

recurringCycle n d = recurringCycle' n d []
recurringCycle' n d m
    | r == 0 = []
    | q == 0 = recurringCycle' (10 * n) d ((q, r): m)
    | any ((== r) . snd) m = map fst ((q, r) : (reverse $ takeWhile ((/= r) . snd) m))
    | otherwise = recurringCycle' r d ((q, r) : m) where
    (q, r) = quotRem n d

maximumBy f = foldr1 (\a b -> if compare (f a) (f b) == GT then a else b)
