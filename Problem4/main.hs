{-# LANGUAGE FlexibleInstances #-}

import Data.List
import Data.Maybe
import qualified Data.Heap as H
import qualified Data.Tree as T
import Data.Ord

instance Ord a => Ord (T.Tree a) where
    compare = comparing T.rootLabel

main :: IO ()
main = print $ fromJust $ find (palindrome . show) $ descendingProducts [999, 998 .. 100]

palindrome :: Eq a => [a] -> Bool
palindrome s = s == reverse s

descendingProducts :: [Integer] -> [Integer]
descendingProducts as = unfoldr (fmap f . H.view) (H.singleton $ diagonal as :: H.MaxHeap (T.Tree Integer))
    where
    f (T.Node i ns, t) = (i, t `H.union` H.fromList ns)

column :: [a] -> T.Tree a
column [a] = T.Node a []
column (a:as) = T.Node a [column as]

diagonal :: [Integer] -> T.Tree Integer
diagonal [a] = T.Node (a * a) []
diagonal (a:as) = T.Node (a * a) [diagonal as, column $ map (* a) as]
