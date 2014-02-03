import Data.List

main :: IO ()
main = print $ sum $ map (length . bases) $ takeWhile (9 `match`) [1..]

bases :: Integer -> [Integer]
bases p = filter (`match` p) [1..9]

match :: Integer -> Integer -> Bool
match b p = genericLength (show $ b^p) == p
