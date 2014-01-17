import Data.Numbers.Primes
import Data.List
import Data.Function
import Data.Maybe
import qualified Data.Sequence as Seq
import qualified Data.Foldable as Foldable

main = print $ maxConsecutives 1000000

upper n = length $ takeWhile (<= n) $ scanl1 (+) primes

maxConsecutives n = head $ filter isPrime $ concatMap (takeWhile (<= n') . gen) $ reverse [1 .. upper n']
    where
    n' = last $ takeWhile (<= n) primes

gen n = gen' (Seq.fromList $ take n primes) (drop n primes)

gen' line ps = Foldable.sum line : gen' (Seq.drop 1 $ line Seq.|> head ps) (tail ps)
