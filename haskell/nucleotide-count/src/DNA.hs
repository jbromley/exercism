module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.List
import Data.Map (Map, fromList)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

charToNucleotide :: Char -> Either String Nucleotide
charToNucleotide ch
    | ch == 'A' = Right A
    | ch == 'C' = Right C
    | ch == 'G' = Right G
    | ch == 'T' = Right T
    | otherwise = Left $ "invalid: " ++ [ch]

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = 
    case traverse charToNucleotide xs of
        Left err -> Left err
        Right ns -> Right $ fromList $ map (\lns -> (head lns, length lns)) $ (group . sort) ns
