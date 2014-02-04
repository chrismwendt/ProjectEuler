import Data.Ratio
import Data.Char

main :: IO ()
main = print $ sum $ map digitToInt $ show $ numerator $ convergent $ take 100 $ 2 : concat [[1, 2*k, 1]| k <- [1..]]

convergent :: [Integer] -> Ratio Integer
convergent [a] = a % 1
convergent (a:as) = a % 1 + 1 / (convergent as)
