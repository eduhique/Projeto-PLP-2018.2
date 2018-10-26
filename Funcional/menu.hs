import KeysGenarator
import RsaAlgorithm
import System.IO
import MyRandom

main :: IO ()
main = do
	putStr ("\n=====Menu=====\n\n(1) Gerar chaves\n(2) Criptografar mensagem")
	putStr ("\n(3) Descriptografar mensagem\n(4) Criptografar e Descriptografar\n(5) Sair")
	putStr ("\n\nOpção => ")
	hFlush stdout --limpa a saida e evita da entra de usuario receba algo inseperado
	op <- getChar
	case op of
		'1' ->
			do
				putStr ("\n(1)Inserir primos\n(2)Gerar automaticamente\n\nOpção = > \n")
				getLine --Evita que o leitor de entrada do usuario receba espacos em branco
				ent <- getChar
				case ent of
					'1' ->
						do
							putStr ("Insira os primos a seguir: \n\nInsira o primo 1: ")
							hFlush stdout --limpa a saida e evita da entra de usuario receba algo inseperado
							getLine --Evita que o leitor de entrada do usuario receba espacos em branco
							primo1 <- readLn;
							putStr ("\nInsira o primo 2: ")
							hFlush stdout --limpa a saida e evita da entra de usuario receba algo inseperado
							primo2 <- readLn;
							generateKeys primo1 primo2
							main
					'2' ->
						do
							let primo3 = getBigPrime 4
							let primo4 = getBigPrime 4
							generateKeys primo3 primo4
							getLine --Evita que o leitor de entrada do usuario receba espacos em branco
							main
					_ ->
						do
							putStrLn "\nOpção inválida!\n"
							main
		'2' ->
			do
				putStr ("\nInsira a mensagem: ")
				hFlush stdout --limpa a saida e evita da entra de usuario receba algo inseperado
				getLine --Evita que o leitor de entrada do usuario receba espacos em branco
				mensagem <- getLine
				putStr ("\nInsira a Chave pública: \n  n: ")
				hFlush stdout --limpa a saida e evita da entra de usuario receba algo inseperado
				n <- readLn
				putStr ("  e: ")
				hFlush stdout --limpa a saida e evita da entra de usuario receba algo inseperado
				e <- readLn
				cript mensagem e n
				main
		'3' ->
			do
				putStr ("\n\nInsira a mensagem criptografada: ")
				hFlush stdout --limpa a saida e evita da entra de usuario receba algo inseperado
				getLine --Evita que o leitor de entrada do usuario receba espacos em branco
				mensagem2 <- getLine
				putStr ("\nInsira a Chave Privada:  \n  d: ")
				hFlush stdout --limpa a saida e evita da entra de usuario receba algo inseperado
				d <- readLn
				putStr "  n: "
				hFlush stdout --limpa a saida e evita da entra de usuario receba algo inseperado
				n2 <- readLn
				decrip mensagem2 d n2
				main
		'4' ->
			do
				putStr "\n\nInsira a mensagem: "
				hFlush stdout --limpa a saida e evita da entra de usuario receba algo inseperado
				getLine --Evita que o leitor de entrada do usuario receba espacos em branco
				mensagem3 <- getLine;
				putStr ("\nInsira a Chaves:  \n  d: ")
				hFlush stdout --limpa a saida e evita da entra de usuario receba algo inseperado
				d2 <- readLn
				putStr "  n: "
				hFlush stdout --limpa a saida e evita da entra de usuario receba algo inseperado
				n3 <- readLn
				putStr ("  e: ")
				hFlush stdout --limpa a saida e evita da entra de usuario receba algo inseperado
				e2 <- readLn
				doBoth mensagem3 d2 n3 e2
				main
		'5' ->
			return ()
		_ ->
			do
				putStrLn "\nOpção inválida!\n"
				main