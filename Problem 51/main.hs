import Data.Numbers.Primes
import Data.Maybe
import Data.List
import Data.Function

main = print $ head $ solutions 8

solutions n = map (\(mask, f) -> head (maskedPrimes mask)) $
    filter (\(mask, f) -> genericLength f == n && not (null $ maskedPrimes mask)) primeFamilies

maskedPrimes mask = filter isPrime $ map read $ filter noLeadingZero $ sequence [if c == '*' then ['0'..'9'] else [c] | c <- mask]

primeFamilies = map (\f -> (fst f, filter isPrime $ snd f)) families

families = map family language
    where
    family s = (s, family' s)
    family' s = map read $ filter noLeadingZero $ map (replace s '*') ['0'..'9']

language = filter noLeadingZero language'
    where
    language' = concatMap stringsN [1..]
    stringsN n = filter (elem '*') (stringsN' n)
    stringsN' n = sequence (replicate n ('*' : ['0'..'9']))

replace s o n = [if c == o then n else c | c <- s]

noLeadingZero = not . isPrefixOf "0"
