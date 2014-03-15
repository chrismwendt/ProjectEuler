import Data.Char

main :: IO ()
main = print $ sum $ map fst $ filter (uncurry (==)) $ zip ns $ map (sum . map factorial . digits) ns
    where
    ns = [3 .. 9999999]

digits :: Int -> [Int]
digits = map digitToInt . show

factorial :: (Enum a, Num a) => a -> a
factorial n = product [1 .. n]
