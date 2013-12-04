import qualified Data.Map as M
import Data.Maybe

main = print . length . concat . concatMap words . map verbalize $ [1..1000]

verbalizeDigit n = fromJust $ M.lookup n $ M.fromList
    [ (1, "one")
    , (2, "two")
    , (3, "three")
    , (4, "four")
    , (5, "five")
    , (6, "six")
    , (7, "seven")
    , (8, "eight")
    , (9, "nine")
    ]

verbalizeTensDigit n = fromJust $ M.lookup n $ M.fromList
    [ (2, "twenty")
    , (3, "thirty")
    , (4, "fourty")
    , (5, "fifty")
    , (6, "sixty")
    , (7, "seventy")
    , (8, "eighty")
    , (9, "ninety")
    ]

verbalizeTeen n = fromJust $ M.lookup n $ M.fromList
    [ (0, "ten")
    , (1, "eleven")
    , (2, "twelve")
    , (3, "thirteen")
    , (4, "fourteen")
    , (5, "fifteen")
    , (6, "sixteen")
    , (7, "seventeen")
    , (8, "eighteen")
    , (9, "nineteen")
    ]

verbalize n
    | n == 1000 = "one thousand"
    | n >= 100 && hm == 0 = verbalizeDigit hd ++ " hundred"
    | n >= 100 = verbalizeDigit hd ++ " hundred and " ++ verbalize hm
    | n >= 20 && tm == 0 = verbalizeTensDigit td
    | n >= 20 = verbalizeTensDigit td ++ " " ++ verbalize tm
    | n >= 10 = verbalizeTeen tm
    | otherwise = verbalizeDigit n
    where
        (hd, hm) = n `divMod` 100
        (td, tm) = n `divMod` 10
