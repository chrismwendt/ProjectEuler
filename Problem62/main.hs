import Data.List

main :: IO ()
main = print $ find (\cube -> count (isPermutation cube) (takeWhile (<= 10*cube) cubes) == 5) $ cubes

isPermutation :: Int -> Int -> Bool
isPermutation a b = (sort $ show a) == (sort $ show b)

count :: (a -> Bool) -> [a] -> Int
count f = length . filter f

perms :: Int -> [Int]
perms = map read . filter noLeadingZero . nub . permutations . show

noLeadingZero :: String -> Bool
noLeadingZero = not . isPrefixOf "0"

cubes :: [Int]
cubes = map (^3) [1..]
