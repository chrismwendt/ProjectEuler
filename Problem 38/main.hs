import Data.List
import Data.Maybe

main = print $ maximum $ filter isPandigital $ catMaybes $ map try [1..9999]

try n = find ((== 9) . length . show) $ map (\i -> concatenatedProduct n [1..i]) [2..9]

concatenatedProduct n l = read $ concatMap (show . (n *)) l :: Int

isPandigital n = sort (show n) == ['1'..'9']
