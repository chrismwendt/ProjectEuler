-- TODO reduce memory usage
-- TODO increase speed

import Data.List
import Data.Function
import qualified Data.IntMap as I
import Data.Maybe

main :: IO ()
main = print . (+) 1 . fromJust $ elemIndex (maximum l) l where
    l = collatzLengths [1..1000000]

collatzLengths :: [Int] -> [Int]
collatzLengths l = collatzLengths' (I.singleton 1 1) l

collatzLengths' :: I.IntMap Int -> [Int] -> [Int]
collatzLengths' m [] = []
collatzLengths' m (x:xs) = v : collatzLengths' m' xs where
    (v, m') = insertCollatz x m

insertCollatz :: Int -> I.IntMap Int -> (Int, I.IntMap Int)
insertCollatz x m = case I.lookup x m of
    Just v -> (v, m)
    Nothing -> (v' + 1, I.insert x (v' + 1) m') where
        (v', m') = insertCollatz (step x) m

step :: Int -> Int
step n
    | even n = n `div` 2
    | otherwise = 3 * n + 1
