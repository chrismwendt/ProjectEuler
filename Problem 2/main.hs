fibonaccis = 0 : 1 : zipWith (+) fibonaccis (tail fibonaccis)

main = do
    putStrLn . show . sum $ filter even $ takeWhile (<=4000000) fibonaccis
