import Data.List
import qualified Data.MultiMap as M
import qualified Control.Monad.Loops as L
import qualified Control.Monad.State as S
import Data.Functor

data InfiniteList a = InfiniteList a (InfiniteList a)

instance Functor InfiniteList where
    fmap f (InfiniteList e rest) = InfiniteList (f e) (fmap f rest)

integersGE :: Integer -> InfiniteList Integer
integersGE n = InfiniteList n (integersGE $ succ n)

wholes :: InfiniteList Integer
wholes = integersGE 1

cubes :: InfiniteList Integer
cubes = (^3) <$> wholes

main :: IO ()
main = print $ minimum $ S.evalState (L.iterateUntil ((5 ==) . length) collisions) (M.empty, cubes)

collisions :: S.State (M.MultiMap String Integer, InfiniteList Integer) [Integer]
collisions = do
    (mmap, InfiniteList n ns) <- S.get
    let k = sort $ show n
    S.put (M.insert k n mmap, ns)
    (mmap', _) <- S.get
    return $ M.lookup k mmap'
