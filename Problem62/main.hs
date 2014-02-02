import Data.List
import Data.Maybe
import qualified Data.Map as M
import Control.Monad.State as S

main :: IO ()
main = print $ minimum $ fromJust $ find ((5 ==) . length) $ S.evalState (mapM collisions cubes) M.empty

collisions :: Int -> S.State (M.Map String [Int]) [Int]
collisions n = let n' = sort $ show n in do
    modify $ M.insertWith (++) n' [n]
    s <- S.get
    return $ M.findWithDefault [] n' s

cubes :: [Int]
cubes = map (^3) [1..]
