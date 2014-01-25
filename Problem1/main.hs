main :: IO ()
main = print $ sum [x | x <- [1..999] :: [Int], mod x 3 == 0 || mod x 5 == 0]
