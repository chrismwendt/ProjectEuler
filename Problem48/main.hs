main = putStrLn $ takeLast 10 $ show $ sum $ [i^i | i <- [1..1000]]

takeLast n = reverse . take n . reverse
