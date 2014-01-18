import Data.Numbers.Primes
import Data.Maybe
import Data.List
import Data.Function

main = print $ fromJust $ find ((8 ==) . length . longestPrimeFamily) primes

longestPrimeFamily p = maximumBy (compare `on` length) $ map (filter isPrime) $ families p

families :: Integer -> [[Integer]]
families p = map (map read) $ map (family $ show p) (masks $ length $ show p)

family p m = filter (not . isPrefixOf "0") $ map (replace (apply m p) '*') ['0'..'9']

masks n = filter (replicate n ' ' /=) $ sequence (replicate n "* ")

apply mask s = [if l == '*' then '*' else r | (l, r) <- zip mask s]

replace s o n = [if c == o then n else c | c <- s]
