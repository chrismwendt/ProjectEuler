import Data.Numbers.Primes
import Data.Maybe
import Data.List
import Data.Function

main :: IO ()
main = print $ minimum $ fromJust $ find ((8 ==) . length) $ map longestPrimeFamily primes

longestPrimeFamily :: Integer -> [Integer]
longestPrimeFamily p = maximumBy (compare `on` length) $ map (filter isPrime) $ families p

families :: Integer -> [[Integer]]
families p = map (map read) $ map (family $ show p) (masks $ show p)

family :: String -> String -> [String]
family p m = filter (not . isPrefixOf "0") $ map (replace (apply m p) '*') ['0'..'9']

masks :: String -> [String]
masks s = map f $ nub s
    where
    f i = [if c == i then '*' else ' ' | c <- s]

apply :: String -> String -> String
apply mask s = [if l == '*' then '*' else r | (l, r) <- zip mask s]

replace :: String -> Char -> Char -> String
replace s o n = [if c == o then n else c | c <- s]
