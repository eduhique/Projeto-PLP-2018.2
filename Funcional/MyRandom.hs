module MyRandom(
     getBigPrime   
) where

import System.Random
import System.IO
import System.IO.Unsafe

getBigPrime :: Integer -> Integer
getBigPrime n | prime(n) == True = n
              | otherwise = getBigPrime(unsafePerformIO((randomRIO (7000, 15000))))
                                                              
divides :: Integer -> Integer -> Bool
divides d n = rem n d == 0
 
-- The least divisor of n that is at least k.                                   
ldf :: Integer -> Integer -> Integer
ldf k n | divides k n = k
        | k ^ 2 > n = n
        | otherwise = ldf (k + 1) n
 
-- The least divisor of n.                                                      
ld :: Integer -> Integer
ld n = ldf 2 n
 
-- Primality test.                                                              
prime :: Integer -> Bool
prime n | n < 1 = error "must be a positive integer"
        | n == 1 = False
        | otherwise = ld n == n
