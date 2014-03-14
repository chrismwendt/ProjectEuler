import Data.Ratio
import Data.List

main :: IO ()
main = print $ denominator $ product $ map (uncurry (%)) $ filter isNontrivial $ [(n, d) | n <- [10 .. 99], d <- [n + 1 .. 99]]

isNontrivial :: (Integral a, Read a, Show a) => (a, a) -> Bool
isNontrivial (n, d)
    | '0' `elem` (sn ++ sd) = False
    | otherwise = any (\di -> (remove di sn) % (remove di sd) == n % d) $ sn ++ sd
    where
    remove di = read . delete di
    (sn, sd) = (show n, show d)
