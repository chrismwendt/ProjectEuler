import System.IO
import qualified Data.Text as T
import Data.Char
import Data.List

main :: IO ()
main = do
    text <- readFile "names.txt"
    print $ sum $ zipWith (*) [1 .. ] $ map worth $ sort $ splitOn ", " $ filter (/= '"') text

splitOn :: String -> String -> [String]
splitOn s = map T.unpack . T.splitOn (T.pack s) . T.pack

worth :: [Char] -> Int
worth = sum . map (\c -> ord c - ord 'A'  + 1)
