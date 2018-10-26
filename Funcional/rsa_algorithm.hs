module RSA (
   encrypt_message,
   decrypt_message,
   strArr2intArr,
   stringToIntArr
)

import Data.List.Split as Split
import Data.Char as Chard

modAndPow :: (Integer, Integer, Integer) -> Integer
modAndPow (x, y, z) = (x ^ y) `mod` z

encrypt_message :: [Integer] -> Integer -> Integer -> [Integer]
encrypt_message message e n = [modAndPow(x, e, n) | x <- message]

decrypt_message :: [Integer] -> Integer -> Integer -> [Integer]
decrypt_message encrypted d n = [(modAndPow (x, d, n)) | x <- encrypted]

stringToIntArr :: String -> [Integer]
stringToIntArr inp = map read (Split.splitOn " " inp)

strArr2intArr :: String -> [Integer]
strArr2intArr message = [toInteger (Chard.ord x) | x <- message]

-- Inutil
-- intToCh :: Integer -> String
-- intToCh val = [Chard.chr val]

-- chToint :: Char -> Integer
-- chToint val = Chard.ord val
-- \Inutil

main :: IO()
main = do
    
    inp <- getLine; --Recebe tudo q voce quiser dar
    d <- readLn;    --d para crip e para decrip
    n <- readLn;    --n para ambos

    let zap = strArr2intArr inp -- Recebe a mensagem textual e transforma pra ascii
    let hol = stringToIntArr inp -- Recebe os números em string e transforma em array de int
    
    print (zap)
    -- print (hol)

    print (encrypt_message zap d n);    --Criptografa
    -- print (dencrypt_message hol d n);    --Decriptografa