import Data.List

main :: IO ()
main = print $ fst $ head $ filter ((== 1000) . length . show . snd) $ zip [1..] fibonaccis

fibonaccis :: [Integer]
fibonaccis = 1 : 1 : zipWith (+) fibonaccis (tail fibonaccis)
