import Data.List
import Data.Function
import Data.Ratio
import Data.Maybe

main = print $ fst $ maximumBy (compare `on` (length . snd)) $ zip ps $ map solutions ps
    where
    ps = [3..1000]

solutions p = nub $ catMaybes $ map (solution p) [1..p - 1]

solution p a
    | n `mod` d /= 0 = Nothing
    | a <= 0 = Nothing
    | b <= 0 = Nothing
    | otherwise = Just $ sort [a, b, c]
    where
    n = (2 * p * a - p^2)
    d = (2 * (a - p))
    b = n `div` d
    c = sqrt' (a^2 + b^2)

sqrt' = floor . sqrt . fromIntegral
