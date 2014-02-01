import Data.List
import qualified Data.Map as M

main :: IO ()
main = print $ lim 5 M.empty cubes

lim :: Int -> M.Map String (Int, Int) -> [Int] -> Int
lim l m (c:cs) = case M.lookup c' m of
    Just (n, count) -> if count == l-1
        then n
        else lim l (M.adjust (\(n', count') -> (n', count' + 1)) c' m) cs
    Nothing -> lim l (M.insert c' (c, 1) m) cs
    where
    c' = sort $ show c

cubes :: [Int]
cubes = map (^3) [1..]
