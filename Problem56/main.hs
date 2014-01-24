import Data.List
import Data.Char
import Data.Function

main :: IO ()
main = print $ maximum $ map (sum . map digitToInt . show) [a^b | a <- [0 .. 100], b <- [0 .. 100]]
