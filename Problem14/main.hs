-- TODO reduce memory usage
-- TODO increase speed

import Data.List
import qualified Data.IntMap as M
import Control.Monad.State
import Data.Ord

main :: IO ()
main = print $ fst $ maximumBy (comparing snd) $ zip [1..] l where
    l = evalState (collatzs [1..1000000]) (M.singleton 1 1)

step :: Int -> Int
step n
    | even n = n `div` 2
    | otherwise = 3 * n + 1

collatz :: Int -> State (M.IntMap Int) Int
collatz n = do
    m <- get
    if n `M.member` m
        then return (m M.! n)
        else do
            c <- collatz (step n)
            modify (M.insert n (c + 1))
            return (c + 1)

collatzs :: [Int] -> State (M.IntMap Int) [Int]
collatzs = mapM collatz
