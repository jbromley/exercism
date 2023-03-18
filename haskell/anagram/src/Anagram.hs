module Anagram (anagramsFor) where

import Data.Char
import Data.List

isAnagram :: String -> String -> Bool
isAnagram xs ys = lxs /= lys && sort lxs == sort lys
  where
    lxs = map toLower xs
    lys = map toLower ys

anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter (isAnagram xs)
