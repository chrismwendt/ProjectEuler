import Data.List
import Data.Ratio
import Data.Maybe
import qualified Data.Set as Set
import qualified Control.Monad.Loops as L
import qualified Control.Monad.State as S

main :: IO ()
main = print $ count (odd . length . snd) $ map continuedFraction $ filter (not . isSquare) [1 .. 10000]

count :: (a -> Bool) -> [a] -> Integer
count f = genericLength . filter f

isSquare :: Integer -> Bool
isSquare x = (squareRoot x)^2 == x

type Step = (Integer, Integer, Integer, Integer)

continuedFraction :: Integer -> (Integer, [Integer])
continuedFraction n = (n', S.evalState (L.whileJust untilRepeat (\(_, a, _, _) -> return a)) (Set.empty, tail $ iterate step (n, n', 1, -n')))
    where
    n' = squareRoot n

untilRepeat :: S.State (Set.Set Step, [Step]) (Maybe Step)
untilRepeat = do
    (set, s:ss) <- S.get
    if s `Set.member` set
        then return Nothing
        else do
            S.put (Set.insert s set, ss)
            return $ Just s

step :: Step -> Step
step (n, _, mul, off) = (n, whole, bottom, off')
    where
    m = mul % (n - off^2)
    nm = numerator m
    top = squareRoot (nm^2 * n) - nm*off
    bottom = denominator m
    (whole, _) = properFraction (top % bottom)
    off' = top `mod` bottom - squareRoot n

-- This integer square root function came from:
-- http://www.haskell.org/haskellwiki/Generic_number_type#squareRoot
(^!) :: Num a => a -> Int -> a
(^!) x n = x^n
 
squareRoot :: Integer -> Integer
squareRoot 0 = 0
squareRoot 1 = 1
squareRoot n =
   let twopows = iterate (^!2) 2
       (lowerRoot, lowerN) =
          last $ takeWhile ((n>=) . snd) $ zip (1:twopows) twopows
       newtonStep x = div (x + div n x) 2
       iters = iterate newtonStep (squareRoot (div n lowerN) * lowerRoot)
       isRoot r  =  r^!2 <= n && n < (r+1)^!2
   in  head $ dropWhile (not . isRoot) iters
