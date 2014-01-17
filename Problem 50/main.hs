import Data.Numbers.Primes
import Data.List
import Data.Function
import Data.Maybe
import qualified Data.Sequence as Seq
import qualified Data.Foldable as Foldable

main = print $ fst $ maximumBy (compare `on` snd) $ map (\p -> (p, maxConsecutives' p)) $ takeWhile (< (1000000 :: Integer)) primes

upper n = length $ takeWhile (<= n) $ scanl1 (+) primes

maxConsecutives' n = maximum $ (:) 0 $ map length $ go n (sum terp1) (Seq.fromList terp1) terp2
    where
    (terp1, terp2) = splitAt (upper n) primes

-- repeatedly drop the head and append the next prime to the tail, depending on the sum
go n s acc ps
    | Seq.length acc == 0 = []
    | n == s = Foldable.toList acc : go n (s + head ps) (acc Seq.|> (head ps)) (tail ps)
    | n <  s =                       go n (s - Seq.index acc 0) (Seq.drop 1 acc) ps
    | otherwise =                    go n (s + head ps) (acc Seq.|> (head ps)) (tail ps)
