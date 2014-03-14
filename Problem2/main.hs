fibonaccis :: [Int]
fibonaccis = 0 : 1 : zipWith (+) fibonaccis (tail fibonaccis)

main :: IO ()
main = print $ sum $ filter even $ takeWhile (<= 4000000) fibonaccis
