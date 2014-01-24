import Data.Char

main = print . sum . map digitToInt . show . factorial $ 100

factorial n = product [1..n]
