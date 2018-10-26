main :: IO ()
main = do
	putStr ("\n=====Menu=====\n\n(1) Gerar chaves\n(2) Criptografar mensagem")
	putStr ("\n(3) Descriptografar mensagem\n(4) Criptografar e Descriptografar\n(5) Sair")
	putStr ("\n\nOpção => ")
	op <- getChar
	case op of
		'1' ->
			do
				putStr ("\n(1)Inserir primos\n(2)Gerar automaticamente\n\nOpção = > ")
				a <- getChar
				case a of
					'1' ->
						do
							putStr ("Insira os primos a seguir: \nInsira o primo 1: ")
							primo1 <- getLine;
							putStr ("\nInsira o primo 2: ")
							primo2 <- getLine;
							main
					'2' ->
						do
							--Falta metódos para gerar os primos
							main
		'2' ->
			do
				putStrLn ("\nInsira a mensagem: ")
				mensagem <- getLine
				putStr ("\nInsira a Chave pública: \n  n: ")
				n <- getLine
				putStr ("  e: ")
				e <- getLine
				--Falta o metodo encrypt
				main
		'3' ->
			do
				putStr ("\n\nInsira a mensagem criptografada: ")
				mensagem2 <- getLine
				putStr ("\nInsira a Chave Privada:  \n  d: ")
				d <- getLine
				putStr "  n: "
				n2 <- getLine
				--Falta o metodo decrypt
				main
		'4' ->
			do
				putStr "\n\nInsira a mensagem: "
				mensagem3 <- getLine;
				--rsa_algorithm
				main
		'5' ->
			return ()
		_ ->
			do
				putStrLn "\nOpção inválida!\n"
				main

