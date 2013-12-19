import Data.Numbers.Primes
import Data.List
import Data.Maybe
import Data.Char

main = print $ sum try1

isPandigital n = sort (show n) == ['0'..'9']

try1 = filter hasProperty $ drop (factorial 9) $ pandigitals 9

hasProperty n = (&&) ((n `mod` 1000) `mod` 17 == 0) $ and $ zipWith divisibleBy [2,3,5,7,11,13,17] $ map (read . map intToDigit) $ consecutives 3 (drop 1 $ digits n)

digits :: Int -> [Int]
digits = map digitToInt . show

divisibleBy n x = x `mod` n == 0

consecutives n l = [take n c | c <- tails l, length c >= n]

pandigitals :: Int -> [Int]
pandigitals n = map (read . nthPermutation ['0'..intToDigit n]) [0..factorial (n + 1) - 1]

nthPermutation a 0 = a
nthPermutation a n = a !! i : nthPermutation (remove i a) j
    where
    (i, j) = divMod n (factorial $ length a - 1)

remove i as = l ++ tail r
    where
    (l, r) = splitAt i as

factorial n = product [1..n]