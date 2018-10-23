import System.Random

calculaN :: Int -> Int -> Int
calculaN p q = p * q

totiente :: Int -> Int -> Int
totiente p q = (p-1) * (q-1) 


getE :: Int -> IO()
getE tot = 
    do 
        f1 <- randomIO :: IO Int
        if f1 > 0
            then 
                if (gcd tot ((f1) `mod` tot + 2)) == 1 
                    then
                        do
                            putStr ("\n  e: " ++ (show ((f1) `mod` tot + 2)) ++ "\n")
                            getD tot ((f1) `mod` tot + 2) 0 
                    else getE tot

        else if gcd tot ((-f1) `mod` tot + 2) == 1 
                then 
                    do 
                        putStr ("\n  e: " ++ (show ((-f1) `mod` tot + 2)) ++ "\n")
                        getD tot ((-f1) `mod` tot + 2) 0

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