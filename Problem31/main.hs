import Data.List

main :: IO ()
main = print $ ways [1, 2, 5, 10, 20, 50, 100, 200] 200

ways :: [Integer] -> Integer -> Integer
ways _ 0 = 1
ways denominations value = sum $
    [ways (filter (<= d) denominations) (value - d) |
        d <- filter (<= value) denominations]
