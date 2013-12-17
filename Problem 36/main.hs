import Data.Char
import Numeric

main = print $ sum $ filter (\n -> isPalindromic (showBinary n) && isPalindromic (show n)) [1..999999]

isPalindromic s = s == reverse s

showBinary n = showIntAtBase 2 intToDigit n ""
