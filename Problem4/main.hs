import Data.List
import Data.Maybe
import qualified Data.Heap as H

data Node = Node Integer [Node] deriving (Eq, Ord, Show)

main :: IO ()
main = print $ fromJust $ find (palindrome . show) $ descendingProducts 999 100

palindrome :: Eq a => [a] -> Bool
palindrome s = s == reverse s

descendingProducts :: Integer -> Integer -> [Integer]
descendingProducts high low = unfoldr (fmap f . H.view) $ (H.singleton $ diagonalNode high low :: H.MaxHeap Node)

f ((Node i ns), t) = (i, H.union t (H.fromList ns))

columnNode :: Integer -> Integer -> Integer -> Node
columnNode slice high low = Node (slice * high) (if high == low then [] else [columnNode slice (pred high) low])

diagonalNode :: Integer -> Integer -> Node
diagonalNode high low = Node (high * high) (if high == low then [] else [diagonalNode (pred high) low, columnNode high (pred high) low])
