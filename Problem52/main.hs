import Data.List
import Data.Maybe

main :: IO ()
main = print $ fromJust $ find (\x -> all (\m -> isMatch x m) $ multiples x) [1 .. ]
    where
    isMatch a b = sort (show a) == sort (show b)
    multiples x = map (x *) [2 .. 6]
