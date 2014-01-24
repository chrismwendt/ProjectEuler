import Data.Numbers.Primes

main = print $ head solutions

solutions =
    [c |
        c <- oddComposites,
        let ss = takeWhile (< c `div` 2) squares,
        all (not . isPrime) $ map (\s -> c - 2 * s) $ ss]

oddComposites = filter (not . isPrime) [3,5..]

squares = map (^2) [1..]
