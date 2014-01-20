import Data.List
import Data.Maybe
import Data.Function
import GHC.Exts
import Text.Read
import Text.ParserCombinators.ReadP hiding (choice)
import Text.ParserCombinators.ReadPrec hiding (choice)
import Data.Tuple

strValMap = map (\(x, y) -> lift $ string x >> return y)

data Rank = Two | Three | Four | Five | Six | Seven | Eight | Nine | Ten | Jack | Queen | King | Ace
    deriving (Eq, Ord, Enum, Bounded)

instance Show Rank where
    show r = fromJust $ lookup r rankToString

instance Read Rank where
    readPrec = choice $ strValMap stringToRank

data Suit = Club | Diamond | Heart | Spade
    deriving (Eq, Ord, Enum)

instance Show Suit where
    show s = fromJust $ lookup s suitToString

instance Read Suit where
    readPrec = choice $ strValMap stringToSuit

stringToRank =
    [ ("2", Two)
    , ("3", Three)
    , ("4", Four)
    , ("5", Five)
    , ("6", Six)
    , ("7", Seven)
    , ("8", Eight)
    , ("9", Nine)
    , ("T", Ten)
    , ("J", Jack)
    , ("Q", Queen)
    , ("K", King)
    , ("A", Ace)
    ]

stringToSuit =
    [ ("C", Club)
    , ("D", Diamond)
    , ("H", Heart)
    , ("S", Spade)
    ]

rankToString = map swap stringToRank

suitToString = map swap stringToSuit

data Card = Card { rank :: Rank, suit :: Suit }
    deriving (Eq)

instance Ord Card where
    compare (Card l _) (Card r _) = compare l r

instance Show Card where
    show (Card { rank=r, suit=s }) = fromJust (lookup r rankToString) ++ fromJust (lookup s suitToString)

type Cards = [Card]

type Pair = Cards

type Triplet = Cards

type Quadruplet = Cards

data HandRank =
      HighCards Cards
    | OnePair Pair Cards
    | TwoPairs Pair Pair Cards
    | ThreeOfAKind Triplet Cards
    | Straight Cards
    | Flush Cards
    | FullHouse Triplet Pair
    | FourOfAKind Quadruplet Cards
    | StraightFlush Cards
    | RoyalFlush Cards
    deriving (Eq, Ord, Show)

handRank :: Cards -> HandRank
handRank cards
    | sort ranks == [Ten .. Ace] && isFlush = RoyalFlush (reverse $ sort cards)
    | isStraight && isFlush = StraightFlush (reverse $ sort cards)
    | map length derp == [1, 4] = FourOfAKind (derp !! 1) (derp !! 0)
    | map length derp == [2, 3] = FullHouse (derp !! 1) (derp !! 0)
    | isFlush = Flush (reverse $ sort cards)
    | isStraight = Straight (reverse $ sort cards)
    | map length derp == [1, 1, 3] = ThreeOfAKind (derp !! 2) (reverse $ sort $ (derp !! 0) ++ (derp !! 1))
    | map length derp == [1, 2, 2] = TwoPairs (if derp !! 1 < derp !! 2 then (derp !! 2) else (derp !! 1)) (if derp !! 1 < derp !! 2 then (derp !! 1) else (derp !! 2)) (derp !! 0)
    | map length derp == [1, 1, 1, 2] = OnePair (derp !! 3) (reverse $ sort $ (derp !! 0) ++ (derp !! 1) ++ (derp !! 2))
    | otherwise = HighCards $ reverse $ sort cards
    where
    terp = groupWith rank cards
    derp = sortBy (compare `on` length) terp
    ranks = map rank cards
    suits = map suit cards
    isStraight = allPairs (\(Card { rank=l }) (Card { rank=r }) -> (r /= (minBound :: Rank)) && l == pred r) (sort $ cards)
    isFlush = length (nub suits) == 1
    allPairs f c = and $ zipWith f c (tail c)


compareHands :: Cards -> Cards -> Ordering
compareHands l r = compare (handRank l) (handRank r)

readCard :: String -> Card
readCard s = Card (read (take 1 s) :: Rank) (read (take 1 $ drop 1 s) :: Suit)

cerp :: String -> String
cerp s = case cerp' s of
    LT -> "Player 2"
    EQ -> "?"
    GT -> "Player 1"
    where
    cerp' s = compare (handRank $ take 5 $ map readCard $ words s) (handRank $ drop 5 $ map readCard $ words s)

main = do
    text <- readFile "poker.txt"
    print $ length $ filter ("Player 1" ==) $ map cerp $ lines text
