main :: IO ()
main = print $ maximum $ filter (palindrome . show) $ [n*m | n <- [100..999], m <- [100..999]]

palindrome :: Eq a => [a] -> Bool
palindrome s = s == reverse s
