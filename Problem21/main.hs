import Data.Numbers.Primes
import Data.List
import qualified Data.Map as M

main :: IO ()
main = print . sum . filter amicable $ [1 .. 9999]

amicable :: Integral a => a -> Bool
amicable n = n == d (d n) && n /= d n where
    d = sum . properDivisors

properDivisors :: Integral a => a -> [a]
properDivisors n = filter (/= n) $ divisors n

divisors :: Integral a => a -> [a]
divisors 0 = []
divisors n = map product . mapM (\(p, v) -> map (p ^) [0 .. v]) $ primeFactorization n

primeFactorization :: Integral a => a -> [(a, Int)]
primeFactorization n = zip (nub l) (map length $ group l) where
    l = if n == 0 then [] else primeFactors n
