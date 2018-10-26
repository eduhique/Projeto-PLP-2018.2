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
    
    inp <- getLine; --Recebe tudo q voce quiser dar
    d <- readLn;    --d para decrip e para crip
    n <- readLn;    --n para ambos

    let zap = strArr2intArr inp -- Recebe a mensagem textual e transforma pra ascii
    let hol = stringToIntArr inp -- Recebe os números em string e transforma em array de int
    
    print (zap)
    -- print (hol)

    -- print (encrypt_message zap d n);    --Criptografa
    print (decrypt_message hol d n);    --Decriptografa