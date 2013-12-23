import Data.Numbers.Primes
import Data.List
import Data.Choose
import Data.Maybe
import Data.Function

main = putStrLn $ head $ filter (/= "148748178147") $ map concat solutions

solutions =
    [s |
        n <- nubBy ((==) `on` sort) $ map show [1000..9999],
        let pns = nub $ sort $ filter (not . isPrefixOf "0") $ permutations n,
        length pns >= 3,
        s <- listChoose' (length pns) 3 pns,
        let sns = map read s :: [Integer],
        let dns = zipWith (-) (tail sns) sns,
        and $ zipWith (==) dns (tail dns),
        all isPrime sns]

listChoose' n k l = map (map (l !!)) $ map elems $ catMaybes $ takeWhile isJust $ iterate f (Just $ lc)
    where
    lc = listChoose n k [0..n - 1]
    f (Just l) = next l
    f Nothing = Nothing
