import Data.List
import Data.Function
import Data.Ord

main :: IO ()
main = print $ fst $ maximumBy (comparing snd) $ zip [1 .. ] $ map (cycleLength 1) [1 .. 999]

cycleLength :: Integral a => a -> a -> Int
cycleLength n d = cycleLength' n d []
cycleLength' n d rs
    | r == 0 = 0
    | q == 0 = cycleLength' (10 * n) d (r : rs)
    | otherwise = case elemIndex r rs of
        Just i -> i
        Nothing -> cycleLength' r d (r : rs)
    where
    (q, r) = quotRem n d
