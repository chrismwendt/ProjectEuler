import Data.List
import Data.Maybe
import qualified Data.Heap as H

data Node a = Node a [Node a] deriving (Eq, Ord, Show)

main :: IO ()
main = print $ fromJust $ find (palindrome . show) $ descendingProducts [999, 998 .. 100]

palindrome :: Eq a => [a] -> Bool
palindrome s = s == reverse s

descendingProducts :: [Integer] -> [Integer]
descendingProducts as = unfoldr (fmap f . H.view) (H.singleton $ diagonalNode as :: H.MaxHeap (Node Integer))
    where
    f (Node i ns, t) = (i, t `H.union` H.fromList ns)

columnNode :: [a] -> Node a
columnNode [a] = Node a []
columnNode (a:as) = Node a [columnNode as]

diagonalNode :: [Integer] -> Node Integer
diagonalNode [a] = Node (a * a) []
diagonalNode (a:as) = Node (a * a) [diagonalNode as, columnNode $ map (* a) as]
