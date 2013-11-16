main = do
    putStrLn . show $ head [x | x <- [19*20,2*19*20..], all (== 0) [x `mod` i | i <- [3..19]]]
