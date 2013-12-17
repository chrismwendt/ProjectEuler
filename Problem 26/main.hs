import Data.List
import Data.Function

main = print $ fst $ maximumBy (compare `on` snd) $ zip [1..] $ map (cycleLength 1) [1..999]

cycleLength n d = cycleLength' n d []
cycleLength' n d rs
    | r == 0 = 0
    | q == 0 = cycleLength' (10 * n) d (r: rs)
    | elem r rs = length (takeWhile (/= r) rs) + 1
    | otherwise = cycleLength' r d (r : rs) where
    (q, r) = quotRem n d
