module Clock (addDelta, fromHourMin, toString) where

import Text.Printf

data Clock = Clock Int Int
  deriving (Eq)

fromHourMin :: Int -> Int -> Clock
fromHourMin h m = Clock hour minute
  where
    minute = m `mod` 60
    mCarry = m `quot` 60
    hBorrow = if m < 0 && minute /= 0 then 1 else 0
    hour = (h + mCarry - hBorrow) `mod` 24

toString :: Clock -> String
toString (Clock h m) = printf "%02d" h ++ ":" ++ printf "%02d" m

addDelta :: Int -> Int -> Clock -> Clock
addDelta dh dm (Clock h m) = fromHourMin (h + dh) (m + dm)
