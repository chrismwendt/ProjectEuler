import Data.Char
import Numeric

main :: IO ()
main = print $ sum $ filter (\n -> isPalindromic (showBinary n) && isPalindromic (show n)) [1..999999]

isPalindromic :: Eq a => [a] -> Bool
isPalindromic s = s == reverse s

showBinary :: (Integral a, Show a) => a -> String
showBinary n = showIntAtBase 2 intToDigit n ""
