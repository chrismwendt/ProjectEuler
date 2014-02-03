import Data.List
import qualified Data.MultiMap as M

main :: IO ()
main = print $ minimum . fst $ until found next ([], (M.empty, cubes))

found ::  ([a], (b, c)) -> Bool
found = (5 ==) . length . fst

type State = ([Integer], (M.MultiMap String Integer, [Integer]))

next :: State -> State
next (_, (m, c:cs)) = (M.lookup c' m', (m', cs))
    where
    c' = sort $ show c
    m' = M.insert c' c m

cubes :: [Integer]
cubes = map (^3) [1..]
