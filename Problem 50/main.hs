import Data.Numbers.Primes
import Data.List
import Data.Function
import Data.Maybe
import qualified Data.Sequence as Seq
import qualified Data.Foldable as Foldable

-- main = print $ maximumBy (compare `on` maxConsecutives') $ takeWhile (< 100000) primes
main = print $ fst $ maximumBy (compare `on` snd) $ map (\p -> (p, maxConsecutives' p)) $ takeWhile (< (1000000 :: Integer)) primes

upper n = length $ takeWhile (<= n) $ scanl1 (+) primes

-- Seq from upper and primes list, repeatedly drop from sequence and append from primes list to end of seq
-- maxConsecutives' n = 3
maxConsecutives' n = maximum $ (:) 0 $ map length $ go n (sum terp) (Seq.fromList terp) (primes \\ terp)
    where
    terp = take (upper n) primes

go n s acc ps
    -- | null ps = []
    | Seq.length acc == 0 = []
    | n == s = Foldable.toList acc : go n (s - Seq.index acc 0) (Seq.drop 1 acc) (tail ps)
    | n <  s =                       go n (s - Seq.index acc 0) (Seq.drop 1 acc) (tail ps)
    | otherwise =                    go n (s + (head ps))       (acc Seq.|> (head ps))   (tail ps)
    -- | n < s = go n (s - (index acc 0))
