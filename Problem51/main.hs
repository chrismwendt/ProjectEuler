import Data.Numbers.Primes
import Data.Maybe
import Data.List
import Data.Function

main :: IO ()
main = print $ minimum $ fromJust $ find (\f -> length f == 8) $ map longestPrimeFamily primes

longestPrimeFamily :: Integer -> [Integer]
longestPrimeFamily p = maximumBy (compare `on` length) $ map (filter isPrime) $ map (map read) $ families (show p)

families :: String -> [[String]]
families string = map (family string) (masks string)

family :: String -> String -> [String]
family n mask = filter (not . isPrefixOf "0") $ map (replace mask '*') ['0' .. '9']

masks :: String -> [String]
masks string = map (\u -> replace string u '*') $ nub string

replace :: String -> Char -> Char -> String
replace string old new = [if c == old then new else c | c <- string]
