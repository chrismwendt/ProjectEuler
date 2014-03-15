import Data.List
import Data.Numbers.Primes
import Data.Function
import Data.Ord

main :: IO ()
main = print $ uncurry (*) $ fst $ maximumBy (comparing snd) $ zip formulas (map runLength formulas)
    where
    formulas = [(a, b) | a <- [-999 .. 999], b <- [-999 .. 999]]

runLength :: Integral a => (a, a) -> Int
runLength (a, b) = length $ takeWhile isPrime (map f [0 .. ])
    where
    f n = n^2 + a * n + b
