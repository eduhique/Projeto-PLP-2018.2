module RsaAlgorithm (
    cript,
    decrip,
    doBoth
) where

import Data.List.Split as Split
import Data.Char as Chard

modAndPow :: (Integer, Integer, Integer) -> Integer
modAndPow (x, y, z) = (x ^ y) `mod` z

encrypt_message :: [Integer] -> Integer -> Integer -> [Integer]
encrypt_message message e n = [modAndPow(x, e, n) | x <- message]

decrypt_message :: [Integer] -> Integer -> Integer -> [Char]
decrypt_message encrypted d n = [intToCh (fromIntegral(modAndPow (x, d, n))) | x <- encrypted]

stringToIntArr :: String -> [Integer]
stringToIntArr inp = map read (Split.splitOn " " inp)

strArr2intArr :: String -> [Integer]
strArr2intArr message = [toInteger (Chard.ord x) | x <- message]

arrayToString :: [Integer] -> String
arrayToString [] = ""
arrayToString (x : xs) = show x ++ " " ++ arrayToString xs

intToCh :: Int -> Char
intToCh val = Chard.chr val

cript :: String -> Integer -> Integer -> IO()
cript inp e n = do
    let str_to_int_arr = strArr2intArr inp -- Recebe a mensagem textual e transforma pra ascii
    putStrLn ("Criptografando...")
    putStr ("Mensagem Criptografada: ")
    print (arrayToString (encrypt_message str_to_int_arr e n));

decrip :: String -> Integer -> Integer -> IO()
decrip ent d n = do
    let int_str_to_int_arr = stringToIntArr ent -- Recebe os números em string e transforma em array de int
    putStrLn ("Descriptografando...")
    putStr ("Mensagem Descriptografada (ou não): ")
    print (decrypt_message int_str_to_int_arr d n);    --Decriptografa

doBoth :: String -> Integer -> Integer -> Integer -> IO()
doBoth ent d n e = do
    let str_to_int_arr = strArr2intArr ent -- Recebe a mensagem textual e transforma pra ascii
    putStrLn ("Criptografando...")
    putStr ("Mensagem Criptografada: ")
    let criptedArr = encrypt_message str_to_int_arr e n 
    print (criptedArr);    --Criptografa
    let int_str_to_int_arr = (criptedArr) -- Recebe os números em string e transforma em array de int
    putStrLn ("Descriptografando (ou não)...")
    putStr ("Mensagem Descriptografada (ou não): ")
    print (decrypt_message int_str_to_int_arr d n);    --Decriptografa