import Data.Numbers.Primes
import Data.List
import Data.Maybe
import Data.Char

main :: IO ()
main = print $ fromJust $ find isPrime $ concatMap pandigitals (reverse [1..9])

pandigitals :: Int -> [Int]
pandigitals n = map (read . nthPermutation (reverse ['1'..intToDigit n])) [0..factorial n - 1]

nthPermutation :: [a] -> Int -> [a]
nthPermutation a 0 = a
nthPermutation a n = a !! i : nthPermutation (remove i a) j
    where
    (i, j) = divMod n (factorial $ length a - 1)

remove :: Int -> [a] -> [a]
remove i as = l ++ tail r
    where
    (l, r) = splitAt i as

factorial :: (Enum a, Num a) => a -> a
factorial n = product [1..n]
