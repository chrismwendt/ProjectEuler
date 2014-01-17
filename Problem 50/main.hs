import Data.Numbers.Primes
import Data.List
import Data.Function
import Data.Maybe
import qualified Data.Sequence as Seq
import qualified Data.Foldable as Foldable

main = print $ fst $ maximumBy (compare `on` snd) $ map (\p -> (p, maxConsecutives' p)) $ takeWhile (< (1000000 :: Integer)) primes

maxConsecutives' n = maximum $ (:) 0 $ map length $ go n 0 Seq.empty primes

-- repeatedly drop the head and append the next prime to the tail, depending on the sum
go n s acc ps
    | head ps > n = []
    | s == n = Foldable.toList acc : go n (s + head ps) (acc Seq.|> (head ps)) (tail ps)
    | s <  n =                       go n (s + head ps) (acc Seq.|> (head ps)) (tail ps)
    | otherwise =                    go n (s - Seq.index acc 0) (Seq.drop 1 acc) ps
