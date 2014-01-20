import Data.Char
import Data.Bits
import Data.List
import Data.Maybe

main :: IO ()
main = do
    text <- readFile "cipher1.txt"
    print $ sum $ textToASCII $ original text

original :: String -> String
original text = fromJust $ find hasWords $ map (\p -> unCipher p text) $ sequence (replicate 3 ['a' .. 'z'])

hasWords :: String -> Bool
hasWords s = all (\t -> isInfixOf t s) ["the", "from"]

textToASCII :: String -> [Integer]
textToASCII text = map (fromIntegral . ord) text

cipherToASCII :: String -> [Integer]
cipherToASCII text = map read $ words [if c == ',' then ' ' else c | c <- text]

unCipher :: String -> String -> String
unCipher password text = map (chr . fromIntegral) $ zipWith xor (map ord $ cycle password) $ map fromIntegral $ cipherToASCII text
