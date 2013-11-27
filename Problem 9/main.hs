import Data.List

main = putStrLn . show . head $ map product [[a,b,c] | b <- [292..499], let (a, m) = (500000 - 1000 * b) `divMod` (1000 - b), let c = 1000 - a - b, m == 0]

-- (0) given a < b < c
-- (1) given a^2 + b^2 = c^2
-- (2) given a + b + c = 1000
-- using equations (1) and (2), solve for a in terms of b
-- (3) a = (500000 - 1000b) / (1000 - b)
-- (4) the derivative of equation (2) is da/db = -500000 / (b - 1000)^2
-- since (4) is always negative, (3) is monotonically decreasing.
-- this can be reduced to only the search space for which values of a and b meet the given criteria.
-- a < b, so (3)(b) < b. b cannot drop below the value for which (3)(b) = b = 292
-- 0 < a, so 0 < (3)(b). b cannot exceed the value for which 1 == (3)(b) = 499
-- (5) c = 1000 - (3)(b) - b
-- b < c, so b < 1000 - (3)(b) - b. 
-- c has a valid value on the range of b [1..707]
-- intersecting these two ranges [292..499] and [1..707] gives [292..499] as the search space.
