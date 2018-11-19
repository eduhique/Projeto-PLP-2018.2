menu :- write("\n\n=====Menu=====\n\n(1) Gerar chaves\n(2) Criptografar mensagem"),
        write("\n(3) Descriptografar mensagem\n(4) Criptografar e Descriptografar\n(5) Sair"), nl,
        write("\n\nOpção => "), nl, read(OP),
        executar(OP).

executar(OP) :- OP == 1, gerarChaves, menu;
				OP == 2, criptografar, menu;
                OP == 3, descriptografar, menu;
                OP == 4, rsa, menu;
                OP == 5, true;
                write("\n\nOpção Inválida!"), menu.

gerarChaves :- write("\n(1)Inserir primos\n(2)Gerar automaticamente\n\nOpção = > \n"), nl, read(OP2) ->(
	OP2 == 1, write("\nInsira os primos a seguir: \n\nInsira o primo 1: "), nl, read(PRIMO1), nl, 
	write("\nInsira o primo 2: "), nl, read(PRIMO2);
	OP2 == 2,write("Falta o método de gerar auto")).
	
criptografar :- write("\nInsira a mensagem: "), nl, read(MENSAGEM),
				write("\nInsira a Chave pública: \n  n: "), nl, read(N), nl,
				write("  \ne: "), nl, read(E), write("Falta metodo crypt aqui").

descriptografar :- write("\n\nInsira a mensagem criptografada: "), nl, read(MENSAGEM2), nl,
				   write("\nInsira a Chave Privada:  \n  d: "), nl, read(D), nl,
				   write("  n: "), nl, read(N2), nl,  write("Falta metodo decrypt").

rsa :- write("\n\nInsira a mensagem: "), nl, read(MENSAGEM3), nl, write("\nInsira a Chaves:  \n  d: "), nl,
	   read(D2), nl, write("  n: "), nl, read(N3), nl, write("  e: "), nl, read(E2), nl, write("Falta o RSA").
