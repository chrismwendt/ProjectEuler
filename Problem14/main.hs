-- TODO reduce memory usage
-- TODO increase speed

import Data.List
import qualified Data.IntMap as M
import Data.Maybe

main :: IO ()
main = print . (+) 1 . fromJust $ elemIndex (maximum l) l where
    l = collatzLengths [1..1000000]

collatzLengths :: [Int] -> [Int]
collatzLengths = collatzLengths' (M.singleton 1 1)

collatzLengths' :: M.IntMap Int -> [Int] -> [Int]
collatzLengths' _ [] = []
collatzLengths' m (x:xs) = v : collatzLengths' m' xs where
    (v, m') = insertCollatz x m

insertCollatz :: Int -> M.IntMap Int -> (Int, M.IntMap Int)
insertCollatz x m = case M.lookup x m of
    Just v -> (v, m)
    Nothing -> (v' + 1, M.insert x (v' + 1) m') where
        (v', m') = insertCollatz (step x) m

step :: Int -> Int
step n
    | even n = n `div` 2
    | otherwise = 3 * n + 1
