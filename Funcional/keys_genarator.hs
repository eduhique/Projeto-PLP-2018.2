module KeysGenerator (
    calculaN,
    getE,
    getD,
    generateKeys
)

import System.Random

calculaN :: Int -> Int -> Int
calculaN p q = p * q

totiente :: Int -> Int -> Int
totiente p q = (p-1) * (q-1) 

newRand = randomIO :: IO Int
 
getE :: Int -> IO()
getE tot = 
    do 
        f1 <- newRand
        let aux = (abs(f1)) `mod` tot + 2
        if (gcd tot aux) == 1 
            then
                do
                    putStr ("\n  e: " ++ (show aux) ++ "\n")
                    getD tot aux 0
                    else getE tot

getD :: Int -> Int -> Int -> IO()
getD to e aux = 
    if ((e * aux) `mod` to) == 1
        then putStr ("\nChave Privada: \n  d: "++ show (aux))
        else getD to e (aux + 1)

generateKeys :: Int -> Int -> IO()
generateKeys p q = do
    putStr ("\n\nChave pública: \n  n: "++show(n))
    getE t   
    putStr ("\n  Primo 1: "++show(p)++"\n  Primo 2: "++show(q)++ "\n\n")
    where   
        n = calculaN p q
        t = totiente p q