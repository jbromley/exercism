module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA = traverse fromDNA
    where 
        fromDNA :: Char -> Either Char Char
        fromDNA 'A' = pure 'U'
        fromDNA 'T' = pure 'A'
        fromDNA 'C' = pure 'G'
        fromDNA 'G' = pure 'C'
        fromDNA ch = Left ch
