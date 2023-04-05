module Clock (addDelta, fromHourMin, toString) where

import Text.Printf

data Clock = Clock Int Int
  deriving (Eq)

fromHourMin :: Int -> Int -> Clock
fromHourMin h m = Clock hour minute
  where
    minute = m `mod` 60
    hour = (h + m `quot` 60) `mod` 24

toString :: Clock -> String
toString (Clock h m) = printf "%02d" h ++ ":" ++ printf "%02d" m

addDelta :: Int -> Int -> Clock -> Clock
addDelta dh dm (Clock h m) = fromHourMin (h + dh) (m + dm)
