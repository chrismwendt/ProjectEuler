main = putStrLn $ reverse $ take 10 $ reverse $ show $ sum $ [i^i | i <- [1..1000]]
