import Data.List
import Data.Maybe
import Data.Function
import GHC.Exts
import Text.Read
import Text.ParserCombinators.ReadP hiding (choice)
import Text.ParserCombinators.ReadPrec hiding (choice)
import Data.Tuple
import Data.Ord

main :: IO ()
main = do
    text <- readFile "poker.txt"
    print $ length $ filter ("Player 1" ==) $ map winner $ lines text

winner :: String -> String
winner s = case winner' s of
    LT -> "Player 2"
    EQ -> "Draw"
    GT -> "Player 1"
    where
    winner' s = compare (handRank $ take 5 cards) (handRank $ drop 5 cards)
    cards = map read $ words s

strValMap :: [(String, a)] -> [ReadPrec a]
strValMap = map (\(x, y) -> lift $ string x >> return y)

-- Rank
data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
    deriving (Eq, Ord, Enum, Bounded)

instance Show Rank where
    show r = fromJust $ lookup r rankToString

instance Read Rank where
    readPrec = choice $ strValMap stringToRank

stringToRank :: [(String, Rank)]
stringToRank = zip (words "2 3 4 5 6 7 8 9 T J Q K A") [Two .. Ace]

rankToString :: [(Rank, String)]
rankToString = map swap stringToRank

-- Suit
data Suit = Club | Diamond | Heart | Spade
    deriving (Eq, Ord, Enum)

instance Show Suit where
    show s = fromJust $ lookup s suitToString

instance Read Suit where
    readPrec = choice $ strValMap stringToSuit

stringToSuit :: [(String, Suit)]
stringToSuit = zip (words "C D H S") [Club .. Spade]

suitToString :: [(Suit, String)]
suitToString = map swap stringToSuit

-- Card
data Card = Card { rank :: Rank, suit :: Suit }
    deriving (Eq)

instance Ord Card where
    compare (Card l _) (Card r _) = compare l r

instance Show Card where
    show (Card { rank=r, suit=s }) = fromJust (lookup r rankToString) ++ fromJust (lookup s suitToString)

instance Read Card where
    readsPrec _ (r:s:cs)
        | [r] `elem` map fst stringToRank &&
          [s] `elem` map fst stringToSuit = [(Card (fromJust $ lookup [r] stringToRank) (fromJust $ lookup [s] stringToSuit), cs)]
        | otherwise = []
    readsPrec _ _ = []

-- Convenience
type Cards = [Card]

-- Hand rank
data HandRank =
      HighCards     Cards
    | OnePair       Cards
    | TwoPairs      Cards
    | ThreeOfAKind  Cards
    | Straight      Cards
    | Flush         Cards
    | FullHouse     Cards
    | FourOfAKind   Cards
    | StraightFlush Cards
    | RoyalFlush    Cards
    deriving (Eq, Ord, Show)

handRank :: Cards -> HandRank
handRank cards
    | sRanks == [Ace, King .. Ten] && isFlush = RoyalFlush    (reverse $ sort cards)
    | isStraight && isFlush                   = StraightFlush (reverse $ sort cards)
    | rankCounts == [4, 1]                    = FourOfAKind   (concat rankGroups)
    | rankCounts == [3, 2]                    = FullHouse     (concat rankGroups)
    | isFlush                                 = Flush         (reverse $ sort cards)
    | isStraight                              = Straight      (reverse $ sort cards)
    | rankCounts == [3, 1, 1]                 = ThreeOfAKind  (concat rankGroups)
    | rankCounts == [2, 2, 1]                 = TwoPairs      (concat rankGroups)
    | rankCounts == [2, 1, 1, 1]              = OnePair       (concat rankGroups)
    | otherwise                               = HighCards     (reverse $ sort cards)
    where
    sRanks = sort $ map rank cards
    rankGroups = reverse $ sortBy (comparing length) $ groupWith rank cards
    rankCounts = map length rankGroups
    isStraight = sRanks == [head sRanks .. last sRanks]
    isFlush = length (nub $ map suit cards) == 1
