:- use_module(keysGenarator).
:- use_module(rsaAlgorithm).
:- use_module(basicOne).
:- initialization menu.

input(Number):-
    read_line_to_codes(user_input, Codes),
    string_to_atom(Codes, Atom),
    atom_number(Atom, Number).

menu :-
        set_prolog_stack(global, limit(100 000 000 000)),
        write("\n=====Menu=====\n\n(1) Gerar chaves\n(2) Criptografar mensagem"),
        write("\n(3) Descriptografar mensagem\n(4) Criptografar e Descriptografar\n(5) Sair"), nl,
        write("\nOpção => "), input(OP),
        executar(OP).

executar(OP) :-
  OP == 1, gerarChaves, menu;
	OP == 2, criptografar, menu;
  OP == 3, descriptografar, menu;
  OP == 4, rsa, menu;
  OP == 5, true;
  write("\n\nOpção Inválida!"), menu.

gerarChaves :-
  write("\n(1)Inserir primos\n(2)Gerar automaticamente\n\nOpção => "), input(OP2) -> (
	OP2 == 1 -> (
    write("\nInsira os primos a seguir: \n\nInsira o primo 1: "), input(PRIMO1), nl,
  	write("Insira o primo 2: "), input(PRIMO2),
    (isPrime(PRIMO1),isPrime(PRIMO2),PRIMO1>=5,PRIMO2>=5) -> (
    geraKeys(PRIMO1,PRIMO2));
    writeln("\nValores inseridos invalidos"));
	OP2 == 2 -> (
    basicOne(PRIMO1),
    basicOne(PRIMO2),
    geraKeys(PRIMO1,PRIMO2))).

criptografar:- write("\nInsira a mensagem: "), read_line_to_string(user_input, MENSAGEM),
				write("\nInsira a Chave pública: \n  n: "), nl, input(N), nl,
				write("  \ne: "), nl, input(E), nl, writeln("Criptografando..."),
        stringToAscii(LISTA, MENSAGEM), write(MENSAGEM), encrypt(LISTA, CODIFICADA, E, N),
        write("Mensagem Criptografada: "), write(CODIFICADA).


descriptografar :- write("\n\nInsira a mensagem criptografada: "), nl, read(CODIFICADA), nl,
				  write("\nInsira a Chave Privada:  \n  d: "), nl, read(D), nl,
				  write("  n: "), nl, read(N), nl,
          decrypt(CODIFICADA, DECODIFICADA, D, N),
          asciiToString(DECODIFICADA, RESULTADO_STRING),
          write('decodificada: '), write(RESULTADO_STRING).

rsa :-
  write("\n\nInsira a mensagem: "), nl, read(MENSAGEM), nl, write("\nInsira a Chaves:  \n  d: "), nl,
	input(D), nl, write("  n: "), nl, input(N), nl, write("  e: "), nl, input(E), nl, write("Falta o RSA").
