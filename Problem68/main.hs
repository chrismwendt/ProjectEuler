import Data.List
import Data.Ord

data Ring = Ring ([Int], [Int]) deriving (Show, Eq, Ord)

main :: IO ()
main = print $ toInta $ toGroups $ maximumBy (comparing (toInta . toGroups)) $ filter ((== 16) . length . show . toInta . toGroups) $ filter magic $ map normalize rings

magic :: Ring -> Bool
magic r = (== 1) $ length $ nub $ map sum $ toGroups r

normalize :: Ring -> Ring
normalize (Ring (e, i)) = Ring $ unzip $ minimum $ shifts $ zip e i

shifts :: [a] -> [[a]]
shifts l = take (length l) $ iterate (\(a:as) -> as ++ [a]) l

rings :: [Ring]
rings = map (\l -> Ring (take 5 l, drop 5 l)) $ permutations [1 .. 10]

toGroups :: Ring -> [[Int]]
toGroups (Ring (e, i)) = zipWith (:) e (take (length i) (map (take 2) $ tails (cycle i)))

toInta :: [[Int]] -> Int
toInta = read . concatMap (concatMap show)
