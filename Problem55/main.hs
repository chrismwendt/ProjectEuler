main :: IO ()
main = print $ length $ filter isLychrel [0 .. 10^4 - 1]

isLychrel :: Integer -> Bool
isLychrel n = not $ any (palindrome . show) $ (if n < 10^4 then take 50 else id) $ tail $ iterate step n

step :: Integer -> Integer
step n = n + read (reverse $ show n)

palindrome :: Eq a => [a] -> Bool
palindrome s = s == reverse s
