import Data.Numbers.Primes
import Data.List
import Data.Function
import Data.Maybe
import qualified Data.Sequence as Seq
import qualified Data.Foldable as Foldable

main = print $ maxConsecutives 1000000

upper n = length $ takeWhile (<= n) $ scanl1 (+) primes

maxConsecutives limit = head $ filter isPrime $ concatMap (gen n) $ reverse [1 .. upper n]
    where
    n = last $ takeWhile (<= limit) primes

gen n i = takeWhile (<= n) $ gen' (Seq.fromList $ take i primes) (drop i primes)

gen' line ps = Foldable.sum line : gen' (shift line (head ps)) (tail ps)

shift s a = Seq.drop 1 $ s Seq.|> a
