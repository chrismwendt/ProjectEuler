import Data.Numbers.Primes

main :: IO ()
main = print $ head solutions

solutions :: [Integer]
solutions =
    [c |
        c <- oddComposites,
        let ss = takeWhile (< c `div` 2) squares,
        all (not . isPrime) $ map (\s -> c - 2 * s) $ ss]

oddComposites :: [Integer]
oddComposites = filter (not . isPrime) [3,5..]

squares :: [Integer]
squares = map (^2) [1..]
