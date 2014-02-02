import Data.List
import qualified Data.Map as M

main :: IO ()
main = print $ minimum . fst3 $ until found next ([], M.empty, cubes)

fst3 :: (a, b, c) -> a
fst3 (a, _, _) = a

found ::  ([a], b, c) -> Bool
found = (5 ==) . length . fst3

type State = ([Integer], M.Map String [Integer], [Integer])

next :: State -> State
next (_, m, c:cs) = (cur, M.insert c' cur m, cs)
    where
    c' = sort $ show c
    cur = c : M.findWithDefault [] c' m

cubes :: [Integer]
cubes = map (^3) [1..]
