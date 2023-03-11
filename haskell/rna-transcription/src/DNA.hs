module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA "" = Right ""
toRNA (x:xs)
    | x == 'A' = ("U" ++) <$> toRNA xs
    | x == 'T' = ("A" ++) <$> toRNA xs
    | x == 'C' = ("G" ++) <$> toRNA xs
    | x == 'G' = ("C" ++) <$> toRNA xs
    | otherwise = Left x
          
