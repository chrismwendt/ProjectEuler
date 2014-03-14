main :: IO ()
main = print $ abs $ sumSquares - squareSum where
    sumSquares = sum $ map (^2) [1 .. 100]
    squareSum = sum [1 .. 100] ^ 2
