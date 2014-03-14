{-# LANGUAGE FlexibleInstances #-}

import Data.List
import qualified Data.Heap as H
import qualified Data.Tree as T
import Data.Ord

instance Ord a => Ord (T.Tree a) where
    compare = comparing T.rootLabel

main :: IO ()
main = print $ sum $ nub $ map _1of3 $ filter isPandigital $ takeWhile ((<= 10000) . _1of3) $ ascendingProducts [1..]

isPandigital :: Show a => (a, a, a) -> Bool
isPandigital (n, m, p) = sort (concatMap show [n, m, p]) == ['1'..'9']

ascendingProducts :: [Integer] -> [(Integer, Integer, Integer)]
ascendingProducts as = unfoldr (fmap f . H.view) (H.singleton $ diagonal as :: H.MinHeap (T.Tree (Integer, Integer, Integer)))
    where
    f (T.Node i ns, t) = (i, t `H.union` H.fromList ns)

column :: [a] -> T.Tree a
column [a] = T.Node a []
column (a:as) = T.Node a [column as]

diagonal :: [Integer] -> T.Tree (Integer, Integer, Integer)
diagonal [a] = T.Node (a * a, a, a) []
diagonal (a:as) = T.Node (a * a, a, a) [diagonal as, column $ map (\n -> (a * n, a, n)) as]

_1of3 :: (t1, t2, t3) -> t1
_1of3 (v, _, _) = v
