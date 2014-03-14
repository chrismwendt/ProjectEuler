import Data.Numbers.Primes
import Data.List
import qualified Data.IntSet as I

main :: IO ()
main = print $ sum $ filter (\i -> not . any (\a -> I.member (i - a) set) $ takeWhile (<= i `div` 2) as) [1 .. cap] where
    set = I.fromList as
    as = takeWhile (<= cap) abundants
    cap = 28123

abundants :: [Int]
abundants = filter isAbundant [1 .. ]

isAbundant :: Integral a => a -> Bool
isAbundant n = sum (properDivisors n) > n

properDivisors :: Integral a => a -> [a]
properDivisors n = filter (/= n) $ divisors n

divisors :: Integral a => a -> [a]
divisors 0 = []
divisors n = map product . mapM (\(p, v) -> map (p ^) [0 .. v]) $ primeFactorization n

primeFactorization :: Integral a => a -> [(a, Int)]
primeFactorization n = zip (nub l) (map length $ group l) where
    l = if n == 0 then [] else primeFactors n
