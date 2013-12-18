import System.IO
import qualified Data.Text as T
import Data.Char
import Data.List
import qualified Data.Set as S

main = do
    text <- readFile "words.txt"
    print $ length $ filter isTriangleWord $ splitOn "," $ filter (/= '"') $ text

splitOn s = map T.unpack . T.splitOn (T.pack s) . T.pack

isTriangleWord n = S.member (worth n) triangles26

worth = sum . map (\c -> ord c - ord 'A'  + 1)

triangles26 = S.fromList $ take 26 $ triangles

triangles = map (\n -> (n * (n + 1) `div` 2)) [1..]
