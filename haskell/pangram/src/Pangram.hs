module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = all (flip elem $ map toLower text) ['a'..'z']
