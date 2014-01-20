import Data.Ratio

main :: IO ()
main = print $ length $ filter (\r -> length (show $ numerator r) > length (show $ denominator r)) $ take 1000 $ iterate step (1 + 1 % 2)

step :: Rational -> Rational
step r = 1 + 1 / (1 + r)
