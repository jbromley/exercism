module Luhn (isValid) where

import Data.Char (ord)

digitToNum :: Char -> Int
digitToNum ch = ord ch - ord '0'

isValid :: String -> Bool
isValid n = error "You need to implement this function."
