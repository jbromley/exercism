module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)

normalize :: String -> String
normalize s = map toLower $ filter isAlphaNum s

gridSize :: Int -> (Int, Int)
gridSize n = head $ dropWhile (\(x, y) -> x * y < n) ss
  where
    r = floor $ (sqrt :: Double -> Double) $ fromIntegral n
    ss = [(r, r), (r, r + 1), (r + 1, r + 1)]

chunksOf :: Int -> [a] -> [[a]]
chunksOf _ [] = []
chunksOf n l = take n l : chunksOf n (drop n l)

transposeLists :: [[a]] -> [[a]]
transposeLists ([] : _) = []
transposeLists ls = map head ls : transposeLists (map tail ls)

padRight :: Int -> String -> String
padRight n s
  | length s < n = s ++ replicate (n - length s) ' '
  | otherwise = s

encode :: String -> String
encode xs = unwords $ transposeLists $ map (padRight c) $ chunksOf c ns
  where
    ns = normalize xs
    (_, c) = gridSize $ length ns
