import Data.Char

main :: IO ()
main = print $ product $ map d (map (10^) [0 .. 6])

-- begin the search in the span of digits for which the positive integers have 1 digit
d :: Int -> Int
d i = d' (1, i - 1)
-- repeatedly subtract the number of digits in spans of positive integers with length l until the requested index is contained in this span, then return the digit from the correct integer
d' :: (Int, Int) -> Int
d' (l, i)
    | i <= l * c = let (d, m) = i `divMod` l in digitToInt $ show (10^(l - 1) + d) !! m
    | otherwise = d' (l + 1, i - l * c)
    where
    -- the number of positive integers with l digits (9, 90, 900, ..)
    c = (10^l - 10^(l - 1))
