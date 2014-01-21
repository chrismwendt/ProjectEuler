import Data.List

main = print $ ways [1, 2, 5, 10, 20, 50, 100, 200] 200

ways _ 0 = 1
ways denominations value = sum $
    [ways (filter (<= d) denominations) (value - d) |
        d <- denominations,
        d <= value]
