main = print $ primes !! 10001

primes :: [Integer]
primes = 2 : [x | x <- [3,5..], not . any (`divides` x) $ takeWhile (<= sqrt' x) primes]
    where
        a `divides` b = b `mod` a == 0
        sqrt' x = (floor . sqrt . fromIntegral) x
