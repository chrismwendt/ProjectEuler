main :: IO ()
main = print $ length $ concat $ concatMap words $ map verbalize $ [1 .. 1000]

verbalize :: Int -> [Char]
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
        verbalizeDigit = (!!) (words "zero one two three four five six seven eight nine")
        verbalizeTensDigit = (!!) (words ". . twenty thirty forty fifty sixty seventy eighty ninety")
        verbalizeTeen = (!!) (words "ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen")
