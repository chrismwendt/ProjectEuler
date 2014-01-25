import Data.List

main :: IO ()
main = putStrLn $ nthPermutation (1000000 - 1) ['0'..'9']

nthPermutation :: Int -> [a] -> [a]
nthPermutation 0 a = a
nthPermutation n a = a !! i : nthPermutation j (remove i a) where
    (i, j) = divMod n (factorial $ length a - 1)

remove :: Int -> [a] -> [a]
remove i as = l ++ tail r where
    (l, r) = splitAt i as

factorial :: (Enum a, Num a) => a -> a
factorial n = product [1..n]
