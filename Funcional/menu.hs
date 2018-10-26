import KeysGenarator
import RsaAlgorithm
import System.IO

main :: IO ()
main = do
	putStr ("\n=====Menu=====\n\n(1) Gerar chaves\n(2) Criptografar mensagem")
	putStr ("\n(3) Descriptografar mensagem\n(4) Criptografar e Descriptografar\n(5) Sair")
	putStr ("\n\nOpção => ")
	hFlush stdout
	op <- getChar
	case op of
		'1' ->
			do
				putStr ("\n(1)Inserir primos\n(2)Gerar automaticamente\n\nOpção = > \n")
				getLine
				ent <- getChar
				case ent of
					'1' ->
						do
							putStr ("Insira os primos a seguir: \n\nInsira o primo 1: ")
							hFlush stdout
							getLine
							primo1 <- readLn;
							putStr ("\nInsira o primo 2: ")
							hFlush stdout
							primo2 <- readLn;
							generateKeys primo1 primo2
							main
					'2' ->
						do
							--Falta metódos para gerar os primos
							main
					_ ->
						do
							putStrLn "\nOpção inválida!\n"
							main
		'2' ->
			do
				putStr ("\nInsira a mensagem: ")
				hFlush stdout
				getLine
				mensagem <- getLine
				putStr ("\nInsira a Chave pública: \n  n: ")
				hFlush stdout
				n <- readLn
				putStr ("  e: ")
				hFlush stdout
				e <- readLn
				cript mensagem e n
				main
		'3' ->
			do
				putStr ("\n\nInsira a mensagem criptografada: ")
				hFlush stdout
				getLine
				mensagem2 <- getLine
				putStr ("\nInsira a Chave Privada:  \n  d: ")
				hFlush stdout
				d <- readLn
				putStr "  n: "
				hFlush stdout
				n2 <- readLn
				decrip mensagem2 d n2
				main
		'4' ->
			do
				putStr "\n\nInsira a mensagem: "
				hFlush stdout
				getLine
				mensagem3 <- getLine;
				putStr ("\nInsira a Chaves:  \n  d: ")
				hFlush stdout
				d2 <- readLn
				putStr "  n: "
				hFlush stdout
				n3 <- readLn
				putStr ("  e: ")
				hFlush stdout
				e2 <- readLn
				doBoth mensagem3 d2 n3 e2
				main
		'5' ->
			return ()
		_ ->
			do
				putStrLn "\nOpção inválida!\n"
				main

