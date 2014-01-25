import Data.List
import qualified Data.Set as S
import qualified Text.Printf as P

main :: IO ()
main = print $ sum $ map read $ filter (not . isPrefixOf "0") $ divisibleConsecutive3s [1,2,3,5,7,11,13,17]

divisibleConsecutive3s :: [Integer] -> [[Char]]
divisibleConsecutive3s divisors = fst $ until (null . snd) f ([""], divisors)
    where 
    f (ns, (d:ds)) = (p ns (divs d), ds)
    divs n = map (P.printf "%03d" :: Integer -> String) $ range 000 999 [0, n..]
    p l r = filter unique $ [a ++ drop (min (length a) 2) b | a <- l, b <- r, hasOverlap 2 a b]
    hasOverlap n a b = isPrefixOf (lastN n a) (take n b)

lastN :: Int -> [a] -> [a]
lastN n = reverse . take n . reverse

unique :: Ord a => [a] -> Bool
unique l = length l == S.size (S.fromList l)

range :: Ord a => a -> a -> [a] -> [a]
range a b = takeWhile (<= b) . dropWhile (< a)
