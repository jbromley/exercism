module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = 
    sum . nub $ factors >>= takeWhile (< limit) . multiples

multiples :: Integer -> [Integer]
multiples 0 = [0]
multiples n = [m * n | m <- [1..]]
