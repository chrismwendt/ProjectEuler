import System.IO
import Data.List.Split
import Data.Char
import Data.List
import qualified Data.Set as S

main :: IO ()
main = do
    text <- readFile "words.txt"
    print $ length $ filter isTriangleWord $ splitOn "," $ filter (/= '"') $ text

isTriangleWord :: [Char] -> Bool
isTriangleWord n = S.member (worth n) triangles26

worth :: [Char] -> Int
worth = sum . map (\c -> ord c - ord 'A'  + 1)

triangles26 :: S.Set Int
triangles26 = S.fromList $ take 26 $ triangles

triangles = map (\n -> (n * (n + 1) `div` 2)) [1 .. ]
