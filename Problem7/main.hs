main :: IO ()
main = print $ primes !! (10001 - 1) -- zero-based indices

primes :: [Integer]
primes = 2 : [x | x <- [3, 5 .. ], not . any (`divides` x) $ takeWhile (<= sqrt' x) primes] where
    a `divides` b = b `mod` a == 0
    sqrt' = (floor . sqrt . fromIntegral)
