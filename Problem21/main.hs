import Data.Numbers.Primes
import Data.List
import qualified Data.Map as M

main = print . sum . filter amicable $ [1..9999]

amicable n = n == d (d n) && n /= d n where
    d = sum . properDivisors

properDivisors n = filter (/= n) $ divisors n

divisors 0 = []
divisors n = map product . mapM (\(p, v) -> map (p ^) [0..v]) $ primeFactorization n

primeFactorization n = zip (nub l) (map length $ group l) where
    l = if n == 0 then [] else primeFactors n
