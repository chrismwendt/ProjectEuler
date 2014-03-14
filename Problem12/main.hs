import Data.List
import Data.Maybe

main :: IO ()
main = print $ fst $ fromJust $ find ((> 500) . snd) $ map (\i -> (triangle i, triangleFactors i)) [1 .. ]

triangle :: Integral a => a -> a
triangle n = n * (n + 1) `div` 2

triangleFactors :: Integral a => a -> Int
triangleFactors n = length (factors a) * length (factors b) where
    (a, b) = if even n then (n `div` 2, n + 1) else (n, (n + 1) `div` 2)

factors :: Integral a => a -> [a]
factors n = nub $ concatMap f [1 .. sqrt' n] where
    f i = if n `mod` i == 0 then [i, n `div` i] else []
    sqrt' = (floor . sqrt . fromIntegral)
