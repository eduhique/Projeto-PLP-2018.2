import Data.List.Split as Split
import Data.Char as Chardi

modAndPow :: (Int, Int, Int) -> Int
modAndPow (x, y, z) = x ^ y `mod` z

decrypt_message :: [String] -> Int -> Int -> String
decrypt_message (num : rest) d n | num == "" = ""
                                 | otherwise = intToCh (modAndPow (read num, d, n)) ++ decrypt_message rest d n 

splitter :: String -> [String]
splitter inp = Split.splitOn " " inp
-- splitter inp = map read (Split.splitOn " " inp)

intToCh :: Int -> String
intToCh val = [Chardi.chr val]

main :: IO()
main = do
    inp <- getLine;
    d <- readLn;
    n <- readLn;

    let splitado = splitter inp
    print (decrypt_message splitado d n);