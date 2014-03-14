main :: IO ()
main = print $ sum $ 1 : map (\i -> 4 * (4 * i^2 + i + 1)) [1 .. 1001 `div` 2]
