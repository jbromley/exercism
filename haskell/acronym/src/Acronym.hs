module Acronym (abbreviate) where

import Data.Char

keepChar :: (Char, String) -> Char -> (Char,  String)
keepChar (lastCh, kept) ch
    | lastCh == '\''  = (ch, kept)
    | not (isAlpha lastCh) && isAlpha ch = (ch, toUpper ch : kept)
    | isLower lastCh && isUpper ch = (ch, ch : kept)
    | otherwise = (ch, kept)

abbreviate :: String -> String
abbreviate xs = reverse $ snd $ foldl keepChar (' ', "") xs
