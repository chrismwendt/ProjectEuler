import Data.List

main = print $ ways [1, 2, 5, 10, 20, 50, 100, 200] 200

ways denominations value = ways' denominations value value

ways' _ 0 _ = 1
ways' denominations value maxD = sum $
    [ways' denominations (value - d) (min d maxD) |
        d <- denominations,
        d <= maxD,
        d <= value]
