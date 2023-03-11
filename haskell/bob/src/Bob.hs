module Bob (responseFor) where

import Data.Char (isLetter, isSpace, isUpper)

responseFor :: String -> String
responseFor xs
    | isSilent = "Fine. Be that way!"
    | isQuestion && isShouting = "Calm down, I know what I'm doing!"
    | isShouting = "Whoa, chill out!"
    | isQuestion = "Sure."
    | otherwise = "Whatever."
    where text = filter (not . isSpace) xs 
          letters = filter isLetter text
          isQuestion = last text  == '?'
          isShouting = all isUpper letters && any isUpper letters
          isSilent = null text
