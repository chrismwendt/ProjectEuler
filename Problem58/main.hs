import Data.List
import Data.Numbers.Primes
import Data.Ratio
import Data.Maybe

main :: IO ()
main = print $ (\(a, b, ((l, s):ls)) -> s - 1) $ fromJust $ find condition $ iterate step (0, 0, rings)

condition :: (Integer, Integer, t) -> Bool
condition (np, nc, l)
    | np == 0 || nc == 0 = False
    | otherwise = fromInteger np / fromInteger (np + nc) < 0.1

step :: (Integer, Integer, [([Integer], Integer)]) -> (Integer, Integer, [([Integer], Integer)])
step (np, nc, ((l, s):ls)) = (np + genericLength np', nc + genericLength nc', ls)
    where
    (np', nc') = partition isPrime l

rings :: [([Integer], Integer)]
rings = iterate step ([1], 0)
    where
    step (l, s) = (corners (last l) (s + 2), s + 2)

corners :: Integer -> Integer -> [Integer]
corners n l = [n + i*l | i <- [1 .. 4]]
