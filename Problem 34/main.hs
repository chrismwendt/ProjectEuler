import Data.Char

main = print $ sum $ map fst $ filter (\(a, b) -> a == b) $ zip ns $ map (sum . map factorial . digits) ns
    where
    ns = [3..9999999]

digits = map digitToInt . show

factorial n = product [1..n]
