import Data.List
import Data.Ord
import Data.Ratio
import qualified Data.Set as Set
import qualified Control.Monad.Loops as L
import qualified Control.Monad.State as S

-- Solution from
-- http://mathworld.wolfram.com/PellEquation.html

main :: IO ()
main = print $ maximumBy (comparing solveX) $ filter (not . isSquare) [1 .. 1000]

solveX :: Integer -> Integer
solveX n = numerator $ convergent $ take (f $ length ls - 1) (l : cycle ls)
    where
    (l:ls) = continuedFraction n
    f r = if odd r
        then r + 1
        else 2*r + 2

convergent :: [Integer] -> Ratio Integer
convergent [a] = a % 1
convergent (a:as) = a % 1 + 1 / (convergent as)

type Step = (Integer, Integer, Integer, Integer)

continuedFraction :: Integer -> [Integer]
continuedFraction n = n' : S.evalState (L.whileJust untilRepeat (\(_, a, _, _) -> return a)) (Set.empty, tail $ iterate step (n, n', 1, -n'))
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

isSquare :: Integer -> Bool
isSquare x
    | x < 0 = False
    | otherwise = (squareRoot x)^2 == x

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
