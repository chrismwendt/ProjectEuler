main = print $ abs $ sumSquares - squareSum
        where sumSquares = sum [x ^ 2 | x <- [1..100]]
              squareSum = sum [1..100] ^ 2
