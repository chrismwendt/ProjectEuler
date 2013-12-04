data Weekday = Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday deriving (Eq, Enum, Ord, Show)

data Month = January | February | March | April | May | June | July | August | September | October | November | December deriving (Eq, Enum, Ord, Show)

data Date = Date {year :: Int, month :: Month, day :: Int} deriving (Eq, Ord, Show)

main = print . length . filter (\(wd, Date y m d) -> wd == Sunday && d == 1) $ dropWhile ((< Date 1901 January 1) . snd) $ zip (drop 1 $ cycle [Sunday .. Saturday]) (dates (Date 1900 January 1) (Date 2000 December 31))

dates from to = takeWhile (< to) $ iterate nextDate from

nextDate (Date y m d) =
    if d == days m y
        then if m == December
            then Date (succ y) January 1
            else Date y (succ m) 1
        else Date y m (succ d)

days m y = [31, f y, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31] !! fromEnum m where
    f y
        | y `mod` 4 == 0 && not (y `mod` 100 == 0) || y `mod` 400 == 0 = 29
        | otherwise = 28
