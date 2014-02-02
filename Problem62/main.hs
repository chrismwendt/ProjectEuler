import Data.List
import qualified Data.Map as M

main :: IO ()
main = print $ minimum . fst $ until found next ([], (M.empty, cubes))

found ::  ([a], (b, c)) -> Bool
found = (5 ==) . length . fst

type State = ([Integer], (M.Map String [Integer], [Integer]))

next :: State -> State
next (_, (m, c:cs)) = (cur, (M.insert c' cur m, cs))
    where
    c' = sort $ show c
    cur = c : M.findWithDefault [] c' m

cubes :: [Integer]
cubes = map (^3) [1..]
