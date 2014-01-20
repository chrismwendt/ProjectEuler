import Data.List
import Data.Numbers.Primes
import Data.Ratio
import Data.Maybe

main :: IO ()
main = print $ (\(a, b, c) -> (head c !! 1) - (head c !! 0) - 1) $ fromJust $ find condition $ dropWhile (\(a, b, c) -> a == 0 || b == 0) $ iterate step (0, 0, rings)

condition (np, nc, l) = fromInteger np / fromInteger (np + nc) < 0.1

step (np, nc, (l:ls)) = (np + genericLength np', nc + genericLength nc', ls)
    where
    (np', nc') = partition isPrime l

rings :: [[Integer]]
rings = map fst $ iterate step ([1], 0)
    where
    step = (\(l, s) -> (corners (last l) (s + 2), s + 2))

corners :: Integer -> Integer -> [Integer]
corners n l = map (\i -> n + i*l) [1..4]
