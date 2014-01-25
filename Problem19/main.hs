import Data.Time.Calendar
import Data.Time.Calendar.WeekDate

main :: IO ()
main = print . length $ filter firstSundayOfMonth [fromGregorian 1901 1 1 .. fromGregorian 2000 12 31] where
    firstSundayOfMonth day = weekday == 7 && d == 1 where
        (_, _, weekday) = toWeekDate day
        (_, _, d) = toGregorian day
