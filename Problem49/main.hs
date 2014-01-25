import Data.Numbers.Primes
import Data.List
import Data.Choose
import Data.Maybe
import Data.Function
import qualified Data.Map as M

main :: IO ()
main = putStrLn $ head $ filter (/= "148748178147") $ map (concatMap show) solutions

solutions :: [[Integer]]
solutions =
    [s |
        e <- M.elems $ M.fromListWith (flip (++)) [(sort $ show p, [p]) | p <- range 1000 9999 primes],
        length e >= 3,
        s <- listChoose' 3 e,
        isArithmetic s]

isArithmetic :: (Eq a, Num a) => [a] -> Bool
isArithmetic l = all (== d) ds
    where
    (d:ds) = zipWith (-) (tail l) l

listChoose' :: Int -> [b] -> [[b]]
listChoose' k l = map (map (l !!)) $ map elems $ catMaybes $ takeWhile isJust $ iterate f (Just $ lc)
    where
    n = length l
    lc = listChoose n k [0..n - 1]
    f (Just l) = next l
    f Nothing = Nothing

range :: Ord a => a -> a -> [a] -> [a]
range a b = takeWhile (<= b) . dropWhile (< a)
