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

intToCh :: Int -> Char
intToCh val = Chard.chr val

main :: IO()
main = do
    
    --Cript or Decript
    -- inp <- getLine; --Recebe tudo q voce quiser dar
    -- d <- readLn;    --d para decrip e para crip
    -- n <- readLn;    --n para ambos

    -- let str_to_int_arr = strArr2intArr inp -- Recebe a mensagem textual e transforma pra ascii
    -- let int_str_to_int_arr = stringToIntArr inp -- Recebe os números em string e transforma em array de int
    
    -- print (str_to_int_arr)
    -- -- print (int_str_to_int_arr)
    
    -- -- print (encrypt_message str_to_int_arr d n);    --Criptografa
    -- print (decrypt_message int_str_to_int_arr d n);    --Decriptografa
    --Cript or Decript

    -- Cript e Decript
    print ("mens ");
    inp <- getLine; --Recebe tudo q voce quiser dar
    print ("d");
    d <- readLn;    
    print ("n");
    n <- readLn;    --n para ambos
    print ("e");
    e <- readLn;    --n para ambos
    
    let str_to_int_arr = strArr2intArr inp -- Recebe a mensagem textual e transforma pra ascii
    print (encrypt_message str_to_int_arr e n);    --Criptografa
    let int_str_to_int_arr = (encrypt_message str_to_int_arr e n) -- Recebe os números em string e transforma em array de int
    print (decrypt_message int_str_to_int_arr d n);    --Decriptografa
    --Cript e Decritp