import Data.List
import qualified Data.MultiMap as M
import qualified Control.Monad.Loops as L
import qualified Control.Monad.State as S

main :: IO ()
main = print $ minimum $ S.evalState (L.iterateUntil ((5 ==) . length) collisions) (M.empty, cubes)

collisions :: S.State (M.MultiMap String Integer, [Integer]) [Integer]
collisions = do
    (mmap, n:ns) <- S.get
    let k = sort $ show n
    S.put (M.insert k n mmap, ns)
    (mmap', _) <- S.get
    return $ M.lookup k mmap'

cubes :: [Integer]
cubes = map (^3) [1..]
