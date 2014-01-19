import Data.Numbers.Primes
import Data.Maybe
import Data.List
import Data.Function

main :: IO ()
main = print $ minimum $ fromJust $ find (\f -> length f == 8) $ map longestPrimeFamily primes

longestPrimeFamily :: Integer -> [Integer]
longestPrimeFamily p = maximumBy (compare `on` length) $ map (filter isPrime) $ families p

families :: Integer -> [[Integer]]
families p = map (map read . family (show p)) (masks $ show p)

family :: String -> String -> [String]
family p m = filter (not . isPrefixOf "0") $ map (replace m '*') ['0'..'9']

masks :: String -> [String]
masks s = map (\i -> replace s i '*') $ nub s

replace :: String -> Char -> Char -> String
replace s o n = [if c == o then n else c | c <- s]
