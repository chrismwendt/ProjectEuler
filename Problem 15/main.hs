main = print $ 40 `choose` 20

n `choose` k = factorial n `div` factorial (n - k) `div` factorial k

factorial n = product [1..n]
