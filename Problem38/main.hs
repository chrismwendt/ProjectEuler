import Data.List
import Data.Maybe

main :: IO ()
main = print $ maximum $ filter isPandigital $ catMaybes $ map try [1..9999]

try :: (Enum b, Num b, Show b) => b -> Maybe Int
try n = find ((== 9) . length . show) $ map (\i -> concatenatedProduct n [1..i]) [2..9]

concatenatedProduct :: (Num b, Show b) => b -> [b] -> Int
concatenatedProduct n l = read $ concatMap (show . (n *)) l :: Int

isPandigital :: Show a => a -> Bool
isPandigital n = sort (show n) == ['1'..'9']
