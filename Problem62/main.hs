import Data.List
import qualified Data.Map as M

main :: IO ()
main = print $ lim 5 M.empty cubes

lim :: Int -> M.Map String [Int] -> [Int] -> Int
lim l m (c:cs) = case M.lookup c' m of
    Just ps -> if length ps == l-1
        then minimum ps
        else lim l (M.adjust ((:) c) c' m) cs
    Nothing -> lim l (M.insert c' [c] m) cs
    where
    c' = sort $ show c

cubes :: [Int]
cubes = map (^3) [1..]
