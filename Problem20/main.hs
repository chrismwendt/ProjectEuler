import Data.Char

main :: IO ()
main = print . sum . map digitToInt . show . factorial $ 100

factorial :: (Enum a, Num a) => a -> a
factorial n = product [1 .. n]
