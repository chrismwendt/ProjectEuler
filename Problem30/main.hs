import Data.Char

-- 354294 (6 * 9^5) is the maximum sum of fifth powers of the digits of a number which has at least as many digits as the number

main :: IO ()
main = print $ sum $ filter f [2 .. 354294]
    where
    f n = n == (sum $ map (^5) $ map digitToInt $ show n)
