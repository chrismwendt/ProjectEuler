main :: IO ()
main = print $ 40 `choose` 20

choose :: Integral a => a -> a -> a
n `choose` k = factorial n `div` factorial (n - k) `div` factorial k

factorial :: (Enum a, Num a) => a -> a
factorial n = product [1 .. n]
