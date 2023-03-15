module SumOfMultiples (sumOfMultiples) where

import Data.List (nub, sort)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = 
   sum $ uniqueInts
   where multList n
             | n == 0 = [0]
             | otherwise = [n, 2 * n ..]
         allInts = foldl (++) [] $ map (\x -> takeWhile (< limit) $ multList x) factors
         uniqueInts = (nub . sort) allInts
